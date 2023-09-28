class Public::GenresController < ApplicationController
  def index
    @genres = current_user.genres
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.user_id = current_user.id
    @genre.save
    redirect_to genres_path
  end

  def edit
    @genre = Genre.find(params[:id])
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
