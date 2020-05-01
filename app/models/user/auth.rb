module User::Auth

  extend ActiveSupport::Concern

  attr_reader :password
  attr_writer :password_confirmation

  included do
    validates :email, presence: true
    validates :password, presence: true, if: Proc.new { |u| u.password_digest.blank? }
    validates :password, confirmation: true
  end

  def authenthicate(password_string)
    digest(password_string) == self.password_digest ? self : false
  end

  def password=(password_string)
    @password = password_string
    self.password_digest = digest(password_string)
  end

  private

  def digest(string)
    Digest::SHA1.hexdigest(string)
  end

end
