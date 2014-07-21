class User::ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end


  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to [:user, @article], notice: "文章发布成功"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to [:user, @article], notice: "文章更新成功" 
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @article.destroy
    redirect_to user_articles_path
  end

  private

  def set_article
    @article = Article.find_by_id(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description, :content)
  end

end
