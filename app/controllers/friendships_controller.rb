class FriendshipsController < ApplicationController
  def destroy
    Friendship.find_by(user_id: params[:id], friend_id: current_user.id).delete
    Friendship.find_by(friend_id: params[:id], user_id: current_user.id).delete
    flash[:notice] = "成功解除朋友關係"
    redirect_back(fallback_location: root_path)
  end
end
