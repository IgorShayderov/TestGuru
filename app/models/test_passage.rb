# frozen_string_literal: true

class TestPassage < ApplicationRecord
  PERCENT_TO_PASS = 85

  cattr_reader :conditions

  @@conditions = {
    condition_1: {
      relate_to: Category,
      exec: lambda do |user_id, category_id|
        all_category_tests_ids = Test.where(category: category_id).pluck(:id)
        all_user_tests_ids = TestPassage.where(user_id: user_id).pluck(:test_id)
        (all_category_tests_ids - all_user_tests_ids).empty?
      end,
      description: 'Успешное прохождения всех тестов из категории'
    },
    condition_2: {
      relate_to: Test,
      exec: lambda do |user_id, test_id|
        TestPassage.where(user_id: user_id, test_id: test_id).count == 1
      end,
      description: 'Выдать бэйдж после успешного прохождения теста с первой попытки'
    },
    condition_3: {
      relate_to: nil,
      exec: lambda do |user_id, level|
        all_tests_of_lvl_ids = Test.where(level: level).pluck(:id)
        all_user_tests_ids = TestPassage.where(user_id: user_id).pluck(:id)
        (all_tests_of_lvl_ids - all_user_tests_ids).empty?
      end,
      description: 'Выдать бэйдж после успешного прохождения всех тестов определённого уровня'
    }
  }

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

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

  cattr_writer :avaliable_conditions

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
