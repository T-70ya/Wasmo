class PlansController < ApplicationController
  before_action :ryaku, only: [:edit, :update]

  def index
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(params_plan)
    if @plan.save
      redirect_to contents_path
    else
      render action: :new
    end
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    if @plan.update(params_plan)
      redirect_to contents_path
    else
      render action: :edit
    end
  end

  private

  def params_plan
    params.require(:plan).permit(:target, :target_month).merge(user_id: current_user.id)
  end

  def ryaku
    @plan = Plan.find(params[:id])
  end
end