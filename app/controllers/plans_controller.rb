class PlansController < ApplicationController

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

  private

  def params_plan
    params.require(:plan).permit(:target, :month).merge(user_id: current_user.id)
  end
end