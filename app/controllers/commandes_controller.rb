class CommandesController < ApplicationController
  def create
    if params[:event_team_id].nil?
      @session = Stripe::Checkout::Session.create(
        {
          payment_method_types: ['card'],
          line_items: @panier.collect { |item| item.to_builder.attributes! },
          mode: 'payment',
          success_url: success_url + "?session_id={CHECKOUT_SESSION_ID}",
          cancel_url: cancel_url,
        }
      )

    else
      team = EventTeam.find(params[:event_team_id])
      @session = Stripe::Checkout::Session.create(
        {
          success_url: success_url ,
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
                # images: [team.photo_url],
              }
            }
          }]
          # + "?session_id={CHECKOUT_SESSION_ID}"
        }
      )

    end
    redirect_to @session.url, allow_other_host: true
  end

  def success
    if params[:session_id].present?
      # session.delete(:cart)
      session[:panier] = [] # empty cart = empty array
      @session_with_expand = Stripe::Checkout::Session.retrieve({ id: params[:session_id], expand: ["line_items"]})
      @session_with_expand.line_items.data.each do |line_item|
        product = Article.find_by(stripe_product_id: line_item.price.product)
      end
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
end
