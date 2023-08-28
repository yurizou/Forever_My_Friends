class Public::GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end
  
  def create
    @genre = Genre.find(params[:id])
    @genre.save
    redirect_to genres_path
  end
  
  def edit
    
  end
  
  def update
    genre = Genre.find(params[:id])
    genre.update(genre_params)
    redirect_to genres_path
  end
  
  private
  
  def genre_params
    params.require(:genre).permit(:name)
    
  end
end
