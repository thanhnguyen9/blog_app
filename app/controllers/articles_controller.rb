class ArticlesController < ApplicationController
  def index
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(articles_params)
    if @article.save
      flash[:success] = 'Article has been created'
      redirect_to articles_path
    else
      render :new
    end
  end

  private

  def articles_params
    params.require(:article).permit(:title, :body)
  end
end
