class SearchesController < ApplicationController
   before_action :authenticate_user!
  
  def search
    
    @friends = []
    @plans =[]
    @range = params[:range]

    if @range == "friend"
      @friends = current_user.friends.search(params[:word])
    elsif @range == "plan"
      # @books = Plan.looks(params[:search], params[:word])
      @plans = current_user.plans.search(params[:word],params[:status])
    end
  end
end
