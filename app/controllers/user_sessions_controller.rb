class UserSessionsController < Devise::SessionsController
  after_action :after_login, only: :create

  private

  def after_login
    user_name = current_user.first_name.present? ?
      current_user.first_name :
      'please, specify your first name'

    flash[:notice] = "Hello, #{user_name}"
  end
end
