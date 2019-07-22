  class MoviesController < ApplicationController
  before_action :find_movie, only:[:show,:edit,:update,:destroy]
  before_action :required_admin, except:[:show,:index]
  def index
    @movies = Movie.all
  end

  def show
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      flash[:notice] = "Successfully Updated Movie"
      redirect_to @movie
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
    @movie = Movie.new(movie_params)
    if @movie.save
      flash[:notice] = "Successfully Created Movie"
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
     @movie.destroy
     flash[:alert] = "Movie Deleted!"
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
