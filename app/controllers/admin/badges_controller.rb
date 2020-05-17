# frozen_string_literal: true

class Admin::BadgesController < ApplicationController
  before_action :set_badges, only: :index
  before_action :set_badge, only: %i[show edit update destroy]

  def index; end

  private

  def set_badges
    @bages = Badge.all
  end
end
