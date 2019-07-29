class GenresController < ApplicationController
  before_action :find_genre, only:[:show,:edit,:destroy,:update]
  before_action :required_signin, only:[:index,:show,:edit,:update,:destroy]



  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = genre.new(user_params)
    if @genre.save
      flash[:notice] = "Signed Up Successfully"
        redirect_to @genre
    else
      render :new
    end
  end

  def show

  end

  def edit
  end

  def update
    if @genre.update(genre_params)
      flash[:notice] = "Successfully updated"
      redirect_to @genre
    else
      render :new
    end
  end


  def destroy
    @genre.destroy
    flash[:warning] = "Deleted!!!"
    redirect_to users_path
  end




  private
  def find_genre
    @genre = Genre.find(params[:id])
  end
  def user_params
   params.require(:genre).permit(:name)
  end

end
