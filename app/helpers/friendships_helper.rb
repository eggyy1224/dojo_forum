module FriendshipsHelper
  def is_friend?(user)
    current_user.friends.include?(user)
  end
end
