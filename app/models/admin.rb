# frozen_string_literal: true

class Admin < User
  validates :first_name, :last_name, presence: true

  def admin?
    is_a?(Admin)
  end
end
