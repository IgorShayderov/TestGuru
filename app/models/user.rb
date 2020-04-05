class User < ApplicationRecord

  def tests_by_level(level)
    Test
      .joins("JOIN user_tests ON tests.id = user_tests.test_id")
      .where("user_id = :id AND level = :level", id: id, level: level)
  end

end
