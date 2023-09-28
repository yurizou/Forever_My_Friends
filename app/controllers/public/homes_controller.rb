class Public::HomesController < ApplicationController
  before_action :authenticate_user!
  def top
     @topics = Topic.order(created_at: :desc).limit(5)
     @user = current_user
     @notices = @user.notices
  end
end
