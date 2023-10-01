class Admin::HomesController < ApplicationController
  def top
    @topics = Topic.order(created_at: :desc).limit(5)
     @user = current_admin
     #@notices = @user.notices
  end
end
