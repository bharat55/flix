class FavoritesController < ApplicationController
  before_action :required_signin
  before_action :find_movie



  def create
    unless Favorite.all.map(&:user_id).include?(current_user.id)
       @favorite =  Favorite.new
       @favorite.movie = @movie
       @favorite.user = current_user
       @favorite.save
       flash[:notice] = "You added #{@movie.title} to your favorites!!!!!"
       redirect_to movie_path(@movie)
    end
  end

  def destroy
    @favorite = Favorite.find_by(user_id:current_user.id)
    @favorite.destroy
    flash[:error] = "You removed #{@movie.title} from your favorites!!!"
    redirect_to movie_path(@movie)
  end

  private
  def find_movie
    @movie = Movie.find(params[:movie_id])
  end


end
