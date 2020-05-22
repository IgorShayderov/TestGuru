# frozen_string_literal: true

class AllCategoriesRule < BaseRule
  def initialize
    @relate_to = Category
    @description = 'Успешное прохождения всех тестов из категории'
  end

  def passed?(category_id, user_id)
    all_category_tests_ids = Test.where(category: category_id).pluck(:id)
    all_user_tests_ids = TestPassage.where(user_id: user_id).pluck(:test_id)
    (all_category_tests_ids - all_user_tests_ids).empty?
  end
end
