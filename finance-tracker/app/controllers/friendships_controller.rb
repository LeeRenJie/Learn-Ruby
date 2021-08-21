class FriendshipsController < ApplicationController
  def create
    current_user.friendships.build(friend_id: params[:friend])
    if current_user.save
      flash[:notice] = "Following friend"
    else
      flash[:alert] = "Could not follow friend"
    end
    redirect_to friends_path
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

