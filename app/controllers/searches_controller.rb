class SearchesController < ApplicationController
   before_action :authenticate_user!

  def search
    @range = params[:range]

    if @range == "User"
      @users = Friend.looks(params[:search], params[:word])
    else
      @books = Plan.looks(params[:search], params[:word])
    end
  end
end
