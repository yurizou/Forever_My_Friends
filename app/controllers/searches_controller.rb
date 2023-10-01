class SearchesController < ApplicationController
   before_action :authenticate_user!
  
  def search
    
    @friends = []
    @plans =[]
    @range = params[:range]

    if @range == "Friend"
      @friends = Friend.search(params[:word])
    elsif @range == "Plan"
      # @books = Plan.looks(params[:search], params[:word])
      @plans = Plan.search(params[:word],params[:status])
    end
  end
end
