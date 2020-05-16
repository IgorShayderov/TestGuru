# frozen_string_literal: true

class Feedback
  include ActiveModel::Model

  attr_accessor :email, :text, :id

  validates :email, :text, presence: true
  validates :email, format: { with: /[a-zA-Z1-9._-]+@\w+\.\w{2,3}/ }, length: { maximum: 150 }
end
