class Admin::TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end
  
  def create
    
  end
  
  def index
    @topics = Topic.all
  end
  
  def edit
    
  end
  
  def show
    
  end
  
  def update
    
  end
  
  
end
