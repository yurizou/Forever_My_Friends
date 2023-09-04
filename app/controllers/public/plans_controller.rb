class Public::PlansController < ApplicationController
  def indx
    @plans = current_user.plans
    
  end
  
  def new
    @plan = Plan.new
    @friend = current_user.friend.all
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
