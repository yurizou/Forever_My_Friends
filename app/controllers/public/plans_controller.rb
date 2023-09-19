class Public::PlansController < ApplicationController
  def index
    @plans = current_user.plans
    @friends = current_user.friends
  end

  def new
    @plan = Plan.new
    @friends = current_user.friends
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.user_id = current_user.id
    @plan.save
    params[:plan][:friend_ids].each do |friend_id| 
    FriendPlan.create(friend_id:friend_id, plan_id:@plan.id) if friend_id.present?
  end
    redirect_to plan_path(@plan)
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def edit
    @plan = Plan.find(params[:id])
    @friends = current_user.friends
  end

  # Ajax用
  def plan_get
    plan = Plan.find(params[:id])
    render json: plan
  end

  def update
    plan = Plan.find(params[:id])
    plan.friend_plans.destroy_all
    params[:plan][:friend_ids].each do |friend_id| 
    FriendPlan.create(friend_id:friend_id, plan_id:plan.id) if friend_id.present?
    end
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
