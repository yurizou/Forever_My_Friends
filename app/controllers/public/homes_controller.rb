class Public::HomesController < ApplicationController
  def top
     @topic = Topic(created_at: :desc).limit(5)
  end
end
