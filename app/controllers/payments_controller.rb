class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
    @commande = current_user.commandes.where(etat: 'en attente').find(params[:commande_id])
  end

  # def create
  #   payload = request.body.read
  #   sig_header = request.env['STRIPE_WEBHOOK_SECRET_KEY']
  #   event = nil

  #   begin
  #     event = Stripe::Webhook.construct_event(
  #       payload, sig_header, Rails.application.credentials[:stripe][:webhook]
  #     )
  #   rescue JSON::ParserError => e
  #     status 400
  #     return
  #   rescue Stripe::SignatureVerificationError => e
  #     # Invalid signature
  #     puts "Signature error"
  #     p e
  #     return
  #   end

  #   # Handle the event
  #   case event.type
  #   when 'checkout.session.completed'
  #     session = event.data.object
  #     @order = Commande.find_by(checkout_session_id: session.data.object.id)
  #     @order.etat = true
  #   end

  #   render json: { message: 'success' }
  # end
end
