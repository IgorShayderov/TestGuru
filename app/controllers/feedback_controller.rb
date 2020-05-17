# frozen_string_literal: true

class FeedbackController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.valid?
      FeedbackMailer.user_feedback(@feedback).deliver_now
      redirect_to tests_path, notice: t('.success')
    else
      render :new, alert: t('.fail')
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:email, :text)
  end
end
