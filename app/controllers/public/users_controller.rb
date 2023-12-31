class Public::UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to users_my_page_path
  end


  def confirm

  end

  def quit
    @user = current_user
    @user.is_delete = true
    @user.save
    reset_session
    redirect_to new_user_registration_path
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :telephone_number, :email)

  end
end
