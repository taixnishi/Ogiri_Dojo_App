class LikesController < ApplicationController
  def create
    like = current_user.likes.build(theme_id: params[:theme_id])
    like.save
    redirect_to themes_path
  end

  def destroy
    like = Like.find_by(theme_id: params[:theme_id], user_id: current_user.id)
    like.destroy
    redirect_to themes_path
  end
end
