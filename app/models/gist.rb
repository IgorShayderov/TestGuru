# frozen_string_literal: true

class Gist < ApplicationRecord
  belongs_to :question
  belongs_to :user

  validates :question, :url, :user, presence: true
end
