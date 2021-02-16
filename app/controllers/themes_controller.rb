class ThemesController < ApplicationController
  before_action :authenticate_user! ,except: [:index]  

  def index
    @themes = Theme.all.order(created_at: :desc)
    @all_ranks = Theme.find(Like.group(:theme_id).order('count(theme_id) desc').limit(3).pluck(:theme_id))
  end

  def new
    @theme = Theme.new
  end

  def create 
    theme = Theme.new(theme_params)
    theme.user_id = current_user.id
    if theme.save
      flash[:notice] = "投稿が完了しました"
      redirect_to :action => :index
    else
      redirect_to :action => :new
    end
  end

  def show
    @theme = Theme.find(params[:id])
    @answers = @theme.answers
    @all_ranks = Answer.find(Favorite.where(theme_id: params[:id]).group(:answer_id).order('count(answer_id) desc').limit(3).pluck(:answer_id))
  end

  def edit
    @theme = Theme.find(params[:id])
  end

  def update
    @theme = Theme.find(params[:id])
    if @theme.update(theme_params)
      flash[:notice] = "編集しました"
      redirect_to :action => :show , :id => @theme.id
    else
      render :action => :edit
    end
  end

  def destroy
    Theme.find(params[:id]).destroy
    flash[:notice] = "削除しました"
    redirect_to :action => :index
  end

  private
        def theme_params
            params.require(:theme).permit(:content,:image)
        end

end
