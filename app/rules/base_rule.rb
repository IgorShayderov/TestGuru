# frozen_string_literal: true

class BaseRule
  attr_reader :description, :relate_to

  def self.init(rule_class)
    rule_class.new
  end
end
