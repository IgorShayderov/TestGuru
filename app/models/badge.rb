# frozen_string_literal: true

class Badge < ApplicationRecord
  has_many :users_badges, dependent: :destroy

  validates :title, :icon, :condition, :condition_param, presence: true

  def self.get_user_badges(user)
    Badge.all.joins(:users_badges).where(users_badges: {user_id: user})
  end
end
