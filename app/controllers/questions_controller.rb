class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index, create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    result = @test.questions.pluck(:body).join("<br>")

    render html: result.html_safe
  end

  def show
    result = Question.find(params[:id]).body

    render html: result
  end

  def new
  end

  def create
    question = @test.questions.create!(question_params)

    render html: question.inspect
  end

  def destroy
    question Question.destroy(params[:id])

    render html: "#{question} has been deleted"
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end

end
