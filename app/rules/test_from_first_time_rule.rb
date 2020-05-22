# frozen_string_literal: true

class TestFromFirstTimeRule < BaseRule
  def initialize
    @relate_to = Test
    @description = 'Выдать бэйдж после успешного прохождения теста с первой попытки'
  end

  def passed?(test_id, user_id)
    seached_test = TestPassage.where(user_id: user_id, test_id: test_id)
    (seached_test.count == 1)
  end
end
