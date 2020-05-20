# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update gist]

  def show
    if @test_passage.test.questions.count.positive?
      render :show
    else
      render plain: 'There are no questions.'
    end
  end
  # test_passage = TestPassage.new(user: User.first, test: Test.first)
  def result
    # тут запускаются все добавленные кондишены
    Badge.all.pluck(:condition, :condition_param, :id).each do |array|
      condition_id = array[0]
      condition_param = array[1]
      badge_id = array[2]
      badge = Badge.find(badge_id)

      if obtained_badge?(condition_id, condition_param)

        if already_have_badge?(badge_id)
          UsersBadge.where(user: current_user, badge: badge).badge_count += 1
        else
          new_badge = UsersBadge.new(user: current_user, badge_id: badge_id, badge_count: 1)
        end

        p "#{new_badge.save} badge saved?"
        flash[badge.title.to_sym] = "Вы получили новый значок <i class=\'fas fa-#{badge.icon} fa-3x'></i>" if new_badge.save
      end
    end

    render :result
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    if result.success?
      flash[:notice] = success_message(result.data.url)
      Gist.create!(
        {
          question: @test_passage.current_question,
          url: result.data.html_url,
          user: current_user
        }
      )
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @test_passage
  end

  private

  def obtained_badge?(condition_id, condition_param)
    TestPassage.conditions[condition_id.to_sym][:exec].call(current_user.id, condition_param)
  end

  def already_have_badge?(badge_id)
    UsersBadge.where(user: current_user, badge: Badge.find(badge_id)).any?
  end

  def success_message(url)
    view_context.link_to(t('.success'), url)
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
