class User < ApplicationRecord

  has_many :tests, inverse_of: 'author'
  has_many :tests_users
  has_many :tests, through: :tests_users, dependent: :destroy

  def tests_by_level(level)
    Test
      .joins(:tests_users)
      .where(tests_users: {user_id: id}, level: level)
  end

end
