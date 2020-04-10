class User < ApplicationRecord

  has_many :tests_users, inverse_of: 'author'
  has_many :tests, through: :tests_users

  def tests_by_level(level)
    Test
      .joins("JOIN users_tests ON tests.id = users_tests.test_id")
      .where("user_id = :id AND level = :level", id: id, level: level)
  end

end
