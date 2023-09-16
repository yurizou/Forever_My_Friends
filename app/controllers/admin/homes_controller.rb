class Admin::HomesController < ApplicationController
  def top
    @topics = Topic.order(created_at: :desc).limit(5)
    pp "@topic-------------------------------#{@topic.inspect}"
  end
end
