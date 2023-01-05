class Article < ApplicationRecord
  has_many :commandes, dependent: :destroy
  belongs_to :event, optional: true
  monetize :price_cents
end
