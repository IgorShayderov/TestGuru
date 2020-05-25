# frozen_string_literal: true

class TestFromFirstTimeRule < BaseRule
  def initialize
    @relate_to = Test
  end

  def passed?(badge, test_passage)
    return if badge_gived?(badge, test_passage)

    test_id = badge.condition_param
    seached_test = TestPassage.where(id: test_passage.id, user_id: test_passage.user_id, test_id: test_id, success: true)
    (seached_test.count == 1)
  end
end
