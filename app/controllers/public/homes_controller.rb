class Public::HomesController < ApplicationController
  def top
     @topics = Topic.order(created_at: :desc).limit(5)
    
  end
end
