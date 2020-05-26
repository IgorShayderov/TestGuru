# frozen_string_literal: true

class AllCategoriesRule < BaseRule
  def initialize
    @relate_to = Category
  end

  def passed?(badge, test_passage)
    return if already_have_badge?(badge, test_passage.user_id)
    return if badge_gived?(badge, test_passage)

    category_id = badge.condition_param
    all_category_tests_ids = Test.where(category: category_id).pluck(:id)
    (all_category_tests_ids - successful_test_passages(test_passage)).empty?
  end
end
