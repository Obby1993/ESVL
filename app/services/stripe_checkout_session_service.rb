class StripeCheckoutSessionService
  def call(event)
    commande = Commande.find_by(checkout_session_id: event.data.object.id)
    commande.update(state: 'payé')
  end
end
