class RelationshipsController < ApplicationController
  def create
    follow = current_user.active_relationships.build(follower_id: params[:user_id])
    follow.save
    @user = current_user.active_relationships.find(params[:following_id])
    @user.create_notification_follow!(current_user)
    redirect_to users_path
  end

  def destroy
    follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    redirect_to users_path
  end
end
