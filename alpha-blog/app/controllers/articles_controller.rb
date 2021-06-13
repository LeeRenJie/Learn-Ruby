class ArticlesController < ApplicationController
  # run set_article for show edit update and destroy only
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def show
  end

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(articles_params)
    @article.user = current_user
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
    flash[:alert] = "Article was deleted."
    redirect_to @article
  end

  # make set_article scoped to this controller
  private

  #repeated command
  def set_article
    @article = Article.find(params[:id])
  end

  def articles_params
    params.require(:article).permit(:title, :description, category_ids: [])
  end

  def require_same_user
    if current_user != @article.user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own article"
      redirect_to @article
    end
  end

end

