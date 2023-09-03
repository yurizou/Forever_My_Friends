class Public::FriendsController < ApplicationController

  def index
    @friends = current_user.friends
  end

  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.new(friend_params)
    @friend.user_id = current_user.id
    @friend.save!
    redirect_to friend_path(@friend)


    #if @friend.save
     #redirect_to friend_path(@friend), notice: '友達が作成されました。'
    #else
      #flash.now[:error] = '友達の作成に失敗しました。'
      #render :new
    #end
  end


  def show
    @friend = Friend.find(params[:id])
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

 def friend_params
   params.require(:friend).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :gender, :birthday, :hobby, :category, :image, :nickname, :genre_id)

 end

end
