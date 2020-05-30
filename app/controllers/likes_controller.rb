class LikesController < ApplicationController
  def create
     # こう記述することで、「current_userに関連したFavoriteクラスの新しいインスタンス」が作成可能。
    # つまり、favorite.user_id = current_user.idが済んだ状態で生成されている。
    # buildはnewと同じ意味で、アソシエーションしながらインスタンスをnewする時に形式的に使われる。
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
