class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def edit
    @article = Article.find(params[:id])

    if @article.save
      redirect to @article
    else
      render 'new'
    end
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      # redirect to show action
      redirect_to @article
    else
      render 'new'
    end
  end

  private
    def article_params
      params.require(:article) .permit(:title, :text)
    end
end
