class UsersController < ApplicationController
  before_action :find_user, only:[:show,:edit,:destroy,:update,:make_admin,:dismiss_admin]
  before_action :required_signin, only:[:index,:show,:edit,:update,:destroy]
  before_action :required_correct_user, only:[:edit,:update,:destroy]



  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @fav_movies = @user.fav_movies
    @reviews = @user.reviews
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Successfully updated"
      redirect_to @user
    else
      render :new
    end
  end


  def destroy
    @user.destroy
    flash[:warning] = "Deleted!!!"
    redirect_to users_path
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Signed Up Successfully"
        redirect_to @user
    else
      render :new
    end
  end

  def make_admin
    @user.admin = true
    @user.save
    flash[:notice] = "#{@user.name} is a Admin now!!"
    redirect_to users_path
  end
  def dismiss_admin
    @user.admin = false
    @user.save
    flash[:error] = "#{@user.name} is a dismissed as Admin now!!"
    redirect_to users_path
  end


  private
  def find_user
    @user = User.find(params[:id])
  end
  def user_params
   params.require(:user).permit(:name,:email,:password,:password_confirmation,:username)
  end

end
