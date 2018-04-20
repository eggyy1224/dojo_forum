module UsersHelper
  def gravatar_for(user, class_value = '')
    image_tag(gravatar_url(user), alt: user.email, class: class_value)
  end

  def gravatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
  end
end
