class AnswersController < ApplicationController
    before_action :authenticate_user!

  def create
    theme = Theme.find(params[:theme_id])
    # @answer = theme.answers.create(answer_params)
    @answer = theme.answers.new(answer_params)
    @answer.user_id = current_user.id
    if @answer.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:success] = "コメントできませんでした"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @theme = Theme.find(params[:theme_id])
    @answer = @theme.answers.find(params[:id])
    @answer.destroy
    redirect_back(fallback_location: root_path)
  end

  private

    def answer_params
      params.require(:answer).permit(:answer)
    end
end
