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
    friendship.destroy
    flash[:notice] = "Stopped following"
    redirect_to friends_path
  end
end
