class User < ApplicationRecord

  has_many :created_tests, class_name: "Test", inverse_of: 'author', foreign_key: 'user_id'
  has_many :tests_users
  has_many :tests, through: :tests_users, dependent: :destroy

  def tests_by_level(level)
      tests_users
      .where(level: level)
  end

end
