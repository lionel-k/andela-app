class ArticlesController < ApplicationController
  def index
    render json: User.all
  end

  def create
    render json: Article.create!(article_params)
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :user_id)
  end
end
