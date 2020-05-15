# frozen_string_literal: true

class Feedback < ApplicationRecord
  validates :email, :text, presence: true
  validates :email, format: { with: /[a-zA-Z1-9._-]+@\w+\.\w{2,3}/ }, length: { maximum: 150 }
end
