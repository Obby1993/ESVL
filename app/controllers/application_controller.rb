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
end
