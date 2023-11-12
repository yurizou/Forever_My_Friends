class Public::FriendsController < ApplicationController

  def index
    @friends = current_user.friends
    @count = @friends.size
    @friends = Kaminari.paginate_array(@friends).page(params[:page]).per(5)
  end

  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.new(friend_params)
    @friend.user_id = current_user.id
    @friend.save
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
    #@status = current_user.@friend.plan.status
  end

  def edit
    @friend = Friend.find(params[:id])
  end

  def update
    friend = Friend.find(params[:id])
    friend.update(friend_params)
    redirect_to friend_path(friend.id)
  end

  def destroy
    friend = Friend.find(params[:id])
    friend.destroy
    flash[:notice] = "フレンドを削除しました"
    redirect_to friends_path
  end

  private

 def friend_params
   params.require(:friend).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :gender, :birthday, :hobby, :category, :image, :nickname, :genre_id)

 end

end
