class Test < ApplicationRecord

  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :category
  has_many :tests_users
  has_many :users, through: :tests_users, dependent: :destroy
  has_many :questions, dependent: :destroy

  def self.test_names_by_category_title(category_title)
      joins(:category)
      .where(categories: { title: category_title })
      .order(title: :desc)
      .pluck(:title)
  end

end
