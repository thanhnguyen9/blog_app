class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_filter :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(articles_params)
    if @article.save
      flash[:success] = 'Article has been created'
      redirect_to articles_path
    else
      flash.now[:danger] = 'Article has not been created'
      render :new
    end
  end

  def show
  end

  def edit
    if current_user != @article.user 
      flash[:danger] = 'You can only edit your own article.'
      redirect_to root_path
    end
  end

  def update
    if current_user != @article.user 
      flash[:danger] = 'You can only edit your own article.'
      redirect_to root_path
    else
      if @article.update(articles_params)
        flash[:success] = 'Article has been updated'
        redirect_to article_path(@article)
      else
        flash.now[:danger] = 'Article has not been updated'
        render :edit
      end
    end
  end

  def destroy
    if @article.delete
      flash[:success] = 'Article has been deleted'
      redirect_to articles_path
    end
  end
  private

  def articles_params
    params.require(:article).permit(:title, :body)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
