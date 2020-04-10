class Test < ApplicationRecord

  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :category
  has_many :questions

  def self.test_names_by_category_title(category_title) 
    self
      .joins("JOIN categories ON category_id = categories.id")
      .where(categories: { title: category_title })
      .order(title: :desc)
      .pluck(:title)
  end

end
