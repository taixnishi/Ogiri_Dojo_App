class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @themes = @user.themes
    @like_themes = @user.like_themes 
  end

  def new_guest
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

    private
      def user_params
          params.require(:theme).permit(:content,:image,:profile)
      end
end
