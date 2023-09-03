class SearchesController < ApplicationController
   before_action :authenticate_user!

  def search
    #@range = params[:range]
    #binding.pry

    #if @range == "User"
      @friends = Friend.where("nickname LIKE ? OR last_name LIKE ?", "%#{params[:word]}%", "%#{params[:word]}%")
    #else
      #@books = Plan.looks(params[:search], params[:word])
    #end
  end
end
