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
      # if send(badge.condition, badge.condition_param, @user_id) && !already_have_badge?(badge.id)
      #   UsersBadge.create!(user_id: @user_id, badge_id: badge.id, test_passage_id: @test_passage.id)
      # end
      badge if send(badge.condition, badge.condition_param, @user_id) && !already_have_badge?(badge.id)
    end
  end

  private

  def already_have_badge?(badge_id)
    UsersBadge.where(user_id: @user_id, badge_id: badge_id, test_passage_id: @test_passage.id).any?
  end

  def pass_all_categories(category_id, user_id)
    RULES[:pass_all_categories].passed?(category_id, user_id)
  end

  def pass_from_first_time(test_id, user_id)
    RULES[:pass_from_first_time].passed?(test_id, user_id)
  end

  def pass_all_tests_by_lvl(level, user_id)
    RULES[:pass_all_tests_by_lvl].passed?(level, user_id)
  end
end
