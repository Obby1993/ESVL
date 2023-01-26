class CommandesController < ApplicationController
  def create
    # if params[:event_team_id].nil?
      article = Article.find(params[:article_id])
      order = Commande.create!( article: article, amount_cents: article.price, etat: 'en attente', user_id: current_user.id)
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          price_data: {
            unit_amount: article.price_cents,
            currency: 'eur',
            product_data: {
              name: article.titre,
              description: article.remarque
              # images: [article.photo_url],
            }
          },
          quantity: 1
        }],
        mode: 'payment',
        success_url: commandes_url(order),
        cancel_url: commandes_url(order)
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
