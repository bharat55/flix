class ReviewsController < ApplicationController
  before_action :find_movie
  before_action :required_signin

  def index
    @reviews = @movie.reviews
  end
  def new
    @reviews = @movie.reviews.new
  end
  def create
    @reviews = @movie.reviews.new(review_params)
    @reviews.user = current_user
    if @reviews.save
      flash[:notice] = "Thanks #{@reviews.user.name} for Review"
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def find_movie
    @movie = Movie.find(params[:movie_id])
  end
  def review_params
   params.require(:review).permit(:stars,:comment)
  end

end
