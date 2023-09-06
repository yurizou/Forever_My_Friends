class Public::PlansController < ApplicationController
  def index
    @plans = current_user.plans
    
  end
  
  def new
    @plan = Plan.new
    @friends = current_user.friends
  end
  
  def create
    
  end
  
  def show
    
  end
  
  def edit
    
  end
  
  def update
    
  end
  
end
