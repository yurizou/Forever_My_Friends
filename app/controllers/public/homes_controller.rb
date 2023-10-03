class Public::HomesController < ApplicationController
  before_action :authenticate_user!
  def top
     @topics = Topic.order(created_at: :desc).limit(5)
     @user = current_user
     @notices = @user.notices.includes(:friend).where(updated_at: Time.current.beginning_of_day..Time.current.end_of_day)
     @birthday_notices = @notices.where(plan_id: 0)
     @meet_friend_notices = @notices.where(plan_id: 1)
     @neglect_friend_notices = @notices.where(plan_id: 2)
  end
end
