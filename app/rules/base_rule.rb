# frozen_string_literal: true

class BaseRule
  attr_reader :relate_to

  private

  def badge_gived?(badge, test_passage)
    UsersBadge.where(user_id: test_passage.user_id, badge: badge, test_passage_id: test_passage.id).any?
  end

  def already_have_badge?(badge, user_id)
    UserBadges.where(badge: badge, user_id: user_id).count.positive?
  end

  def successful_test_passages(test_passage)
    TestPassage.where(user_id: test_passage.user_id, success: true).pluck(:test_id)
  end
end
