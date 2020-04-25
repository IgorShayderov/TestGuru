class Answer < ApplicationRecord

  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validate :validate_number_of_answers, on: :create
  validates :body, presence: true

  private

  def validate_number_of_answers
    if question.present?
      errors.add(:question, "already has 4 answers") if question.answers.count >= 4
    end
  end

end
