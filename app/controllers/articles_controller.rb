class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def add_to_panier
    id = params[:id].to_i
    session[:panier] << id
    redirect_to articles_path()
  end

  def remove_from_panier
    id = params[:id].to_i
    session[:panier].delete(id)
    redirect_to articles_path()
  end

  def index
    @articles = Article.all
    @events = Event.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save!
      redirect_to article_path(@article)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to articles_path(), status: :see_other
  end

  def article_params
    params.require(:article).permit(:titre, :price, :currency)
  end

end
