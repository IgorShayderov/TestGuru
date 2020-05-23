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
    @gained_badged = []
  end

  def badges
    Badge.all.each do |badge|
      if RULES[badge.condition.to_sym].passed?(badge.condition_param, @user_id) && !already_have_badge?(badge)
        @gained_badged << UsersBadge.create!(user_id: @user_id, badge: badge, test_passage_id: @test_passage.id)
      end
    end
    @gained_badged
  end

  private

  def already_have_badge?(badge)
    UsersBadge.where(user_id: @user_id, badge: badge, test_passage_id: @test_passage.id).any?
  end
end
