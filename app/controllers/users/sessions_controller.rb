# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  after_action :after_login, only: :create

  private

  def after_login
    flash[:notice] = t('say_hello', name: @user.name)
  end
end
