class User < ApplicationRecord

  has_many :tests_users, inverse_of: 'author'
  has_many :tests, through: :tests_users

  def tests_by_level(level)
    Test
      .joins("JOIN tests_users ON tests.id = tests_users.test_id")
      .where("user_id = :id AND level = :level", id: id, level: level)
  end

end
