class User < ApplicationRecord

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :created_tests, class_name: 'Test', inverse_of: 'author', foreign_key: 'user_id'
  has_many :test_passages
  has_many :tests, through: :test_passages, dependent: :destroy

  def tests_by_level(level)
    tests_users
      .where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

end
