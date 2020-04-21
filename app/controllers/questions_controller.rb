class QuestionsController < ApplicationController

  before_action :find_test, only: [:index, :create, :new]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions

    redirect_to :controller => 'tests', :action => 'show', :id => params[:test_id]
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = @test.questions.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def update
    @question = Question.find(params[:id])

    if @question.update
      redirect_to @question
    else
      render :new
    end
  end

  def destroy
    @question = Question.destroy(params[:id])

    redirect_to @question.test
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
