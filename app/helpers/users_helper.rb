module UsersHelper
  def image_for(user)
    if user.image_file_name.blank?
      image_tag('placeholder.png')
    else
      image_tag(user.image_file_name)
    end
  end
end
