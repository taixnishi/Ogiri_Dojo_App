class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.build(answer_id: params[:answer_id],theme_id: params[:theme_id])
    favorite.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    favorite = Favorite.find_by(answer_id: params[:answer_id], user_id: current_user.id)
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
