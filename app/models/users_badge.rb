# frozen_string_literal: true

class UsersBadge < ApplicationRecord
  belongs_to :user
  belongs_to :badge
  belongs_to :test_passage
end
