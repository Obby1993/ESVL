class CommandesController < ApplicationController
  skip_before_action :authenticate_user!
  def create
    if params[:event_team_id].nil?
      # Utilise la nouvelle route et la méthode dans ArticlesController
      # redirect_to add_to_panier_path(id: params[:article]), method: :post
      @panier = session[:panier]
      create_stripe_session

    else
      create_stripe_session_for_team(params[:event_team_id])
    end
    redirect_to @session.url, allow_other_host: true
  end

  def success
    # if params[:session_id].present? version origale sans Chat GPT
    if params[:session_id]
      handle_successful_payment(params[:session_id])
    else
      redirect_to cancel_url, alert: "No info to display"
    end
  end

  def cancel
  end

  def index
    if current_user.fonction
      @commandes = Commande.all
    else
      @commandes = current_user.commandes
    end
  end

  def show
    @order = current_user.orders.find(params[:id])
  end


private



  def create_stripe_session
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      mode: 'payment',
      success_url: success_url + "?session_id={CHECKOUT_SESSION_ID}",
      cancel_url: cancel_url,
      # line_items: @panier.map { |item| { 'price' => item['article']['stripe_price_id'], 'quantity' => item['quantity'], 'product_data' => item['size'] } }
      # line_items: @panier.collect { |item| item.to_builder.attributes! }
      line_items: @panier.map do |item|
        {
          'price' => item['article']['stripe_price_id'],
          'quantity' => item['quantity'].to_i,
          'adjustable_quantity' => {
            'enabled' => true,
            'minimum' => 1,
            'maximum' => 14
          }
        }
      end
    )
  end

  def create_stripe_session_for_team(event_team_id)
    team = EventTeam.find(event_team_id)
    @session = Stripe::Checkout::Session.create(
      success_url: success_url + "?session_id={CHECKOUT_SESSION_ID}",
      cancel_url: cancel_url,
      mode: 'payment',
      payment_method_types: ['card'],
      line_items: [{
        quantity: 1,
        price_data: {
          currency: team.event.article.currency,
          unit_amount: team.event.article.price,
          product_data: {
            name: team.event.article.titre,
            description: team.niveau
          }
        }
      }]
    )
  end

  def handle_successful_payment(session_id)
    # session.delete(:cart)
    session[:panier] = [] # empty cart = empty array
    @session_with_expand = Stripe::Checkout::Session.retrieve({ id: params[:session_id], expand: ["line_items"] })
    @session_with_expand.line_items.data.each do |line_item|
      product = Article.find_by(stripe_product_id: line_item.price.product)
      quantity = line_item.quantity
    end
  end
end
