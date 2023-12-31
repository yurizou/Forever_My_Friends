class Admin::TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to admin_topics_path
    else
      render:new
    end
  end

  def index
     @topics  = Topic.page(params[:page]).per(5)
  end

  def edit
    @topic = Topic.find(params[:id])


  end

  def show
    @topic = Topic.find(params[:id])
  end

  def update
    topic = Topic.find(params[:id])
    topic.update(topic_params)
    redirect_to admin_topic_path(topic.id)
  end

 def destroy
   topic =Topic.find(params[:id])
   topic.destroy
   redirect_to admin_topics_path
 end

 private
 def topic_params
   params.require(:topic).permit(:category, :title, :article, :image)
 end
end
