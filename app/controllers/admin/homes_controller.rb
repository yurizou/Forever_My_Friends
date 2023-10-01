class Admin::HomesController < ApplicationController
  def top
    @topics = Topic.order(created_at: :desc).limit(5)
    # @user = current_user
    # @notices = @user.notices
  end
end
