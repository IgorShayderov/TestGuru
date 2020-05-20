# frozen_string_literal: true

class Badge < ApplicationRecord
  has_many :users_badges, dependent: :destroy

  validates :title, :icon, :condition, :condition_param, presence: true
end
