class TestsController < ApplicationController
  before_action :set_test, only: %i[show edit update destroy start]
  before_action :set_user, only: :start

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
  end

  def edit; end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def update
    if @test.update
      redirect_to @test
    else
      render :new
    end
  end

  def destroy
    @test.destroy

    redirect_to tests_url
  end

  def start
    @test = Test.find(params[:id])
    p "!!!"
    p @user.tests
    @user.tests.push(@test)

    redirect_to @user.test_passage(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def set_user
    @user = User.find(2)
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

end
