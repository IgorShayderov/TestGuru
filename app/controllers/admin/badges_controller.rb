# frozen_string_literal: true

class Admin::BadgesController < Admin::BaseController
  before_action :set_badges, only: :index
  before_action :set_badge, only: %i[show edit update destroy]

  def index; end

  def show; end

  def new
    @badge = Badge.new
  end

  def edit; end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badges_path, notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badge_path(@badge)
    else
      render :new
    end
  end

  def destroy
    @badge.destroy

    redirect_to admin_badges_path
  end

  def collection
    condition_param_options
  end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def set_badges
    @badges = Badge.all
  end

  def badge_params
    params.require(:badge).permit(:title, :icon, :condition, :condition_param)
  end

  def condition_param_options
    if params[:condition]
      condition = params[:condition].to_sym

      relate_to = BadgeService::RULES[condition].relate_to
      render json: relate_to.all
    end
  end
end
