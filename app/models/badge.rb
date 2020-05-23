# frozen_string_literal: true

class Badge < ApplicationRecord
  has_many :users_badges, dependent: :destroy
  has_many :users, through: :users_badges, dependent: :destroy

  validates :title, :icon, :condition, :condition_param, presence: true
  validates :condition, inclusion: { in: BadgeService::RULES.keys.map(&:to_s) }
end
