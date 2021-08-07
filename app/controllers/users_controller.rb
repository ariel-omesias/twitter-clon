class UsersController < ApplicationController
  def follow
    if current_user.is_following?(params[:friend_id])
      Friend.where(user_id: current_user.id, friend_id: params[:friend_id]).delete_all
    else
      Friend.create(user_id: current_user.id, friend_id: params[:friend_id])
    end
    redirect_to root_path
  end
end
