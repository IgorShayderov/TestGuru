class TestsUser  < ApplicationRecord
  belongs_to :test
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
end
