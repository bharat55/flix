class ApplicationController < ActionController::Base
  helper_method :current_user, :current_user_admin?, :super_admin?, :current_user?, :current_user_superAdmin?

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def current_user_superAdmin?(user)
     user.super_admin?
  end

  helper_method :current_user

  def super_admin?
    current_user.super_admin? if current_user
  end

  def current_user?(user)
    user.id == current_user.id
  end
  private
  def required_signin
    session[:intended_path] = request.url
    unless current_user || current_user_admin? || super_admin?
      flash[:error] = "You need to loged in first!!!!"
      redirect_to new_sessions_path
    end
  end

  def required_correct_user
    unless @user == current_user || current_user_admin? || super_admin?
      flash[:error] = "You are not authorized to do it!!"
      redirect_to current_user
    end
  end
  def required_admin
    unless current_user_admin? || super_admin?
      flash[:error] = "you are not authorised to proceed"
      redirect_to root_path
    end
  end

  def current_user_admin?
    current_user.admin? if current_user
  end
end
