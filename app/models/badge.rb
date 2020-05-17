# frozen_string_literal: true

class Badge < ApplicationRecord
  validates :title, :path, presence: true
end
