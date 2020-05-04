class Test < ApplicationRecord

  # after_initialize :set_defaults, unless: :persisted?

  # belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :category
  has_many :test_passages
  has_many :users, through: :test_passages, dependent: :destroy
  has_many :questions, dependent: :destroy

  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :tests_by_category_title, -> (category_title) { joins(:category).where(categories: { title: category_title }).order(title: :desc) }

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level }

  def self.test_names_by_category_title(category_title)
    tests_by_category_title(category_title)
      .pluck(:title)
  end

  # def set_defaults
  #   self.user_id ||= User.first.id
  # end

end
