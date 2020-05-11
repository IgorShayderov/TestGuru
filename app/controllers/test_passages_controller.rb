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

  def result; end

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
          url: result.data.url,
          user: current_user
        }
      )
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @test_passage
  end

  private

  def success_message(url)
    view_context.link_to(t('.success'), url)
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
