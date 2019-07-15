  class MoviesController < ApplicationController
  before_action :find_movie, only:[:show,:edit,:update,:destroy]
  def index
    @movies = Movie.all
  end

  def show
  end

  def edit
  end

  def update
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  def new
    @movie = Movie.new
  end
  def hit_movies
    @movies = Movie.show_hit_movies
  end

  def create
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  def destroy
     @movie.destroy
     redirect_to root_url
  end


  private
  def find_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title,:rating,:total_gross,:description,:released_on,:cast,:director,:duration,:image_file_name)
  end
end
