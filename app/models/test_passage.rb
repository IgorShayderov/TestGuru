# frozen_string_literal: true

class TestPassage < ApplicationRecord
  PERCENT_TO_PASS = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true
  has_many :users_badge, dependent: :destroy

  before_validation :before_validation_set_next_question, on: %i[create update]

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def current_question_index
    test.questions.index(current_question) + 1
  end

  def calc_success_percent
    ((self.correct_questions.to_f / self.test.questions.count) * 100).to_i
  end

  def test_passed?
    calc_success_percent >= PERCENT_TO_PASS
  end

  private

  def before_validation_set_next_question
    self.current_question = next_question
  end

  def next_question
    current_question ?
      test.questions.order(:id).where('id > ?', current_question.id).first :
      test.questions.first
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
      correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end
end
