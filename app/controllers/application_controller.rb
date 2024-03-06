class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :initialize_session
  before_action :load_panier



  private

  def initialize_session
    session[:panier] ||= []
  end

  def load_panier
    @panier = Article.where(id: session[:panier])
  end

  # def total_panier(panier)
  #   total = 0
  #   panier.each do |article_panier|
  #     total += article_panier
  #   end
  # end
end
