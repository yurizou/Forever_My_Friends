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

 def destroy
   topics =Topic.find(params[:id])
   topics.destroy
   redirect_to admin_topics_path
 end
end
