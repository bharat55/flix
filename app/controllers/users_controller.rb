class UsersController < ApplicationController
  before_action :find_user, only:[:show,:edit,:destroy,:update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show

  end

  def edit
  end

  def update
    @user.update(user_params)
    flash[:notice] = "Successfully updated"
    redirect_to users_path
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

  private
  def find_user
    @user = User.find(params[:id])
  end
  def user_params
   params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

end
