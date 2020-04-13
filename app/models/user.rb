class User < ApplicationRecord

  has_many :created_tests, :class_name => "Test", inverse_of: 'author'
  has_many :tests_users
  has_many :tests, through: :tests_users, dependent: :destroy

  def tests_by_level(level)
      created_tests
      .where(level: level)
  end

end
