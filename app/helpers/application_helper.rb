module ApplicationHelper
  def current_user?(user)
    user == current_user
  end
  def redirect_to_user(user)
    redirect_to_user
  end
end
