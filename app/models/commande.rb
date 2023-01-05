class Commande < ApplicationRecord
  belongs_to :article
  belongs_to :event_team, optional: true
  monetize :amount_cents
end
