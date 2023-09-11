class Public::PlansController < ApplicationController
  def index
    @plans = current_user.plans
    @friend = current_user.friends
  end

  def new
    @plan = Plan.new
    @friend = current_user.friends
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.user_id = current_user.id
    @plan.save
    redirect_to plan_path(@plan)
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    plan = Plan.find(params[:id])
    plan.update(plan_params)
    redirect_to plans_path
  end

  def destroy
    plan = Plan.find(params[:id])
    plan.destroy
    redirect_to plans_path
  end

  private

  def plan_params
     params.require(:plan).permit(:image, :user_id, :title, :plan_date, :place, :memo, :status)
  end
end
