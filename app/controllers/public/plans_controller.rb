class Public::PlansController < ApplicationController
  def index
    @plans = current_user.plans
    
  end
  
  def new
    @plan = Plan.new
    @friends = current_user.friends
  end
  
  def create
    @plan = Plan.new(plan_params)
    @plan.user_id = current_user.id
    @plan.save
    redirect_to plan_path(@plan)
  end
  
  def show
    
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  
  private
  
  def plans_params
     params.require(:plan).permit(:user_id, :title, :plan_date, :place, :memo, :status)
  end
end
