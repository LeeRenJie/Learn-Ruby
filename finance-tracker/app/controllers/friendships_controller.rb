class FriendshipsController < ApplicationController
  def create
  end

  def destroy
    friendship = current_user.friendships.find_by(friend_id: params[:id])
    friendship.destroy
    flash[:notice] = "Stopped following"
    redirect_to friends_path
  end
end
