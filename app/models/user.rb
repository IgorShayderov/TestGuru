class User < ApplicationRecord

  def tests_by_level(level)
    UserTest
      .joins("JOIN tests ON test_id = tests.id")
      .where("user_id = ? AND level = ?", self.id, level)
  end

end