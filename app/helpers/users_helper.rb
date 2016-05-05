module UsersHelper
  def profile_image_for(user)
    url = "https://secure.gravatar.com/avatar/#{user.gravatar_id}"
    image_tag(url, alt: user.first_name)
  end

  def get_perspective(user)
    if user == current_user
      "you've"
    else
      "#{user.first_name} has"
    end
  end
end
