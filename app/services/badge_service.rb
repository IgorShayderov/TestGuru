# frozen_string_literal: true

class BadgeService
  RULES = {
    pass_all_categories: AllCategoriesRule.new,
    pass_from_first_time: TestFromFirstTimeRule.new,
    pass_all_tests_by_lvl: AllTestsByLvlRule.new
  }.freeze

  def initialize(test_passage)
    @test_passage = test_passage
    @user_id = test_passage.user_id
  end

  def badges
    Badge.all.select do |badge|
      RULES[badge.condition.to_sym].passed?(badge, @test_passage)
    end
  end
end
