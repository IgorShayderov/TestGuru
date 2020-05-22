# frozen_string_literal: true

class BadgesController < ApplicationController
  before_action :set_badges, only: :index
  before_action :user_badges, only: :index

  def index; end

  private

  def user_badges
    @user_badges = Badge.users_badges(current_user)
  end

  def set_badges
    @badges = Badge.all
  end
end
