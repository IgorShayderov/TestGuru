class Users::SessionsController < Devise::SessionsController
  after_action :after_login, only: :create

  private

  def after_login
    flash[:notice] = "Hello, #{user_name}"
  end
end
