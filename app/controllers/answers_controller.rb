class AnswersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_find

  def create
    @answer = @theme.answers.new(answer_params)
    @answer.user_id = current_user.id
    if @answer.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = "コメントできませんでした"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @answer = @theme.answers.find(params[:id])
    @answer.destroy
    redirect_back(fallback_location: root_path)
  end

  private
    def set_find
      @theme = Theme.find(params[:theme_id])
    end

    def answer_params
      params.require(:answer).permit(:answer)
    end
end








