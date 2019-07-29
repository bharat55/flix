module ApplicationHelper
  def current_user?(user)
    user == current_user
  end
  def redirect_to_user(user)
    redirect_to_user
  end
  def movie_added_to_fav?(movie)
    current_user.favorites.map(&:movie_id).include?(movie.id) if current_user
  end

  def page_title
    if content_for(:title)
      "Flix-#{content_for(:title)}"
    else
      "Flix"
    end
  end

end
