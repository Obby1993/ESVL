class Article < ApplicationRecord
  has_many :commandes, dependent: :destroy
  has_many_attached :photos
  belongs_to :event, optional: true

  monetize :price, as: :price_cents

  validates :titre, presence: true
  # validates :genre, inclusion: { in: ["Homme", "Femme", "Homme / Femme", "Pas de genre"] }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :remarque, length: { maximum: 500 }

  def price_in_cents
    (price * 100).to_i
  end

  def to_builder
    Jbuilder.new do |article|
      # article.price stripe_price_id
      article.price price_in_cents
      article.quantity 1
    end
  end

  after_create do
    product = Stripe::Product.create({ name: titre })
    price = Stripe::Price.create({ product: product.id, unit_amount: price_in_cents, currency: self.currency })
    update(stripe_product_id: product.id, stripe_price_id: price.id)
  end
end
