class TestsController < ApplicationController

  before_action :authenticate_user!

  def index
    @tests = Test.all
  end

end
