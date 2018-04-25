module FriendshipsHelper
  def is_friend?(user)
    current_user.friends.include?(user) if current_user
  end
end
