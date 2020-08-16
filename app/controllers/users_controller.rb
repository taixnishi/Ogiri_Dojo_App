class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @themes = @user.themes
    @like_themes = @user.like_themes 
  end

    private
      def user_params
          params.require(:theme).permit(:content,:image,:profile)
      end
end
