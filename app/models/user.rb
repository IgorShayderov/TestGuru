class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', inverse_of: 'author', foreign_key: 'user_id'
  has_many :test_passages
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :badges, class_name: 'UsersBadge', dependent: :destroy

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  def tests_by_level(level)
    tests_users
      .where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def name
    first_name.present? ?
      first_name :
      I18n.t('specify_name')
  end

  def admin?
    is_a?(Admin)
  end
end
