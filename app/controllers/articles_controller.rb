class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def show
    article
  end

  def edit
    article
  end

  def update
    if article.update(article_params)
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def destroy
    article.destroy
    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end

    def article
      @article ||= Article.find(params[:id])
    end
end