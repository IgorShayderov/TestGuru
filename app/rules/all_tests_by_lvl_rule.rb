# frozen_string_literal: true

class AllTestsByLvlRule
  attr_reader :description, :relate_to

  def initialize
    @relate_to = nil
    @description = 'Выдать бэйдж после успешного прохождения всех тестов определённого уровня'
  end

  def passed?(level, user_id)
    all_tests_of_lvl_ids = Test.where(level: level).pluck(:id)
    all_user_tests_ids = TestPassage.where(user_id: user_id).pluck(:id)
    (all_tests_of_lvl_ids - all_user_tests_ids).empty?
  end
end
