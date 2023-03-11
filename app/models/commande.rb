class Commande < ApplicationRecord
  has_many :articles
  belongs_to :event_team, optional: true
  monetize :amount_cents
end
