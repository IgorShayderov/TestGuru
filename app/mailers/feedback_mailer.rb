# frozen_string_literal: true

class FeedbackMailer < ApplicationMailer
  default to: Admin.first.email

  def user_feedback(feedback)
    @feedback = feedback

    mail from: @feedback.email
  end
end
