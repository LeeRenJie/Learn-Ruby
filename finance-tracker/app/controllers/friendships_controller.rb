class FriendshipsController < ApplicationController
  def create
  end

  def destroy
    friendship = current_user.friendships.find_by(friend_id: params[:id])
    if friendship.destroy
      flash[:notice] = "Stopped following"
    else
      flash[:notice] = "Failed to stop following"
    end
    redirect_to friends_path
  end
end

