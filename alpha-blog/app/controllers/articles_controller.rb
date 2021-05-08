class ArticlesController < ApplicationController
  # run set_article for show edit update and destroy only
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(articles_params)
    if @article.save
      flash[:notice] = "Article was created succesfully."
      #Redirect to the newly created article page
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @article.update(articles_params)
      flash[:notice] = "Article was updated succesfully."
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to @article
  end

  # make set_article scoped to this controller
  private

  #repeated command
  def set_article
    @article = Article.find(params[:id])
  end

  def articles_params
    params.require(:article).permit(:title, :description)
  end

end
