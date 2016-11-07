class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order(created_at: :desc)
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
      flash.now[:danger] = 'Article has not been created'
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(articles_params)
      flash[:success] = 'Article has been updated'
      redirect_to article_path(@article)
    else
      flash.now[:danger] = 'Article has not been updated'
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.delete
      flash[:success] = 'Article has been deleted'
      redirect_to articles_path
    end
  end
  private

  def articles_params
    params.require(:article).permit(:title, :body)
  end
end
