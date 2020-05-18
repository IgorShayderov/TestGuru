# frozen_string_literal: true

class Badge < ApplicationRecord
  attr_accessor :conditions

  has_many :users_badges, dependent: :destroy

  validates :title, :icon, :condition, presence: true
end
