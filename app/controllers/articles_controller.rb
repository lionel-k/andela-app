class ArticlesController < ApplicationController
  # acts_as_token_authentication_handler_for User, except: [ :index ]

  def index
    render json: Article.all
  end

  def create
    render json: Article.create!(article_params)
  end

  def destroy
    Article.find(params[:id]).destroy!
    head :no_content
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :user_id)
  end
end
