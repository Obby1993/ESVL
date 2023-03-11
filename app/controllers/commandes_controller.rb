class CommandesController < ApplicationController
  def create
    # if params[:event_team_id].nil?
      @session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: @panier.collect { |item| item.to_builder.attributes! },
        mode: 'payment',
        success_url: success_url,
        cancel_url: cancel_url,
      )
      order.update(checkout_session_id: session.id)
      redirect_to new_commande_payment_path(order.id)

    # else
    #   team = EventTeam.find(params[:event_team_id])
    #   article = Article.where(event_id: team.event.id).first
    #   order = Commande.create!(article: article, event_team: team, amount_cents: team.event.price, etat: 'en attente', user_id: current_user.id)
    #   session = Stripe::Checkout::Session.create(
    #     payment_method_types: ['card'],
    #     line_items: [{
    #       price_data: {
    #         unit_amount: team.event.price_cents,
    #         currency: 'eur',
    #         product_data: {
    #           name: team.nom_equipe,
    #           description: team.niveau
              # images: [team.photo_url],
    #         }
    #       },
    #       quantity: 1
    #     }],
    #     mode: 'payment',
    #     success_url: commandes_url(order),
    #     cancel_url: commandes_url(order)
    #   )
    #   order.update(checkout_session_id: session.id)
    #   redirect_to new_commande_payment_path(order.id)
    # end
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

  # def checkout_session (model)
    # model = event_teams.find(params[:event_teams_id])
    #   order = Commande.create!(article: team, amount_cents: team.price, etat: 'en attente', user_id: current_user.id)
    #   session = Stripe::Checkout::Session.create(
    #     payment_method_types: ['card'],
    #     line_items: [{
    #       price_data: {
    #         unit_amount: team.price_cents,
    #         currency: 'eur',
    #         product_data: {
    #           name: team.titre,
    #           description: team.remarque
    #           # images: [team.photo_url],
    #         }
    #       },
    #       quantity: 1
    #     }],
    #     mode: 'payment',
    #     success_url: commandes_url(order),
    #     cancel_url: commandes_url(order)
    #   )
    #   order.update(checkout_session_id: session.id)
    #   redirect_to new_commande_payment_path(order.id)
  # end
end
