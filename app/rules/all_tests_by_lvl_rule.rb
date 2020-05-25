# frozen_string_literal: true

class AllTestsByLvlRule < BaseRule
  def initialize
    @relate_to = nil
  end

  def passed?(badge, test_passage)
    return if already_have_badge?(badge, test_passage.user_id)
    return if badge_gived?(badge, test_passage)

    level = badge.condition_param
    all_tests_of_lvl_ids = Test.where(level: level).pluck(:id)
    (all_tests_of_lvl_ids - successful_test_passages(test_passage)).empty?
  end
end
