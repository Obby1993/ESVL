class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :add_to_panier, :remove_from_panier]

  def add_to_panier
    article = params[:id]
    quantity_article = params[:quantity].to_i
    size_article = params[:size]
    puts "Contenu de session[:panier] debut : #{session[:panier].inspect}"
    # puts "Contenu de session[:panier] après reinitialisation : #{session[:panier].inspect}"
    @panier = session[:panier]
    existing_item = @panier.find { |n| n["article"]["id"] == article.to_i && n["size"] == size_article }
    if existing_item
      # Si l'article est déjà dans le panier, augmentez la quantité
      art = @panier.select { |n| n["article"]["id"] == article.to_i && n["size"] == size_article}
      art.first["quantity"] += quantity_article
    else
      # Sinon, ajoutez l'article avec une quantité de 1
      article = Article.find(article)
      @panier << { "article" => article.as_json, "quantity" => quantity_article, "size" => size_article }
    end

    session[:panier] = @panier
    Rails.logger.debug("Panier après ajout : #{@panier}")
    # render json: { panier: @panier }
    redirect_to articles_path, notice: "Article ajouté au panier avec succès"
  end





  def remove_from_panier
    id_article_delete = params[:id]
    @panier = session[:panier]
    article_delete = @panier.select { |n| n["article"]["id"] == id_article_delete.to_i }
    @panier.delete(article_delete.first)
    redirect_to articles_path()
    puts "Contenu de session[:panier] : #{session[:panier].inspect}"
  end

  def article_display
    @articles_display = Article.select { |a| a.display == true }
    @article = Article.find(params[:id])
    if @article.display == false && @articles_display.length < 3
      @article.update(display: true)
      @article.save
    elsif @articles_display.length == 3 && @article.display == false
      flash.alert = "Attention il y a déjà 3 articles affichés sur la page d'acceuille ! Veuillez en enlever."
    else
      @article.update(display: false)
    end
    redirect_back(fallback_location: root_path)
  end

  def index
    @articles = Article.all
    @events = Event.all
    @panier = session[:panier]
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
    @article = Article.find(params[:id].to_i)
    @article.destroy
    redirect_to articles_path, status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:titre, :price, :currency, photos: [])
  end
end
