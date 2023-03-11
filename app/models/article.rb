class Article < ApplicationRecord
  has_many :commandes, dependent: :destroy
  belongs_to :event, optional: true

  monetize :price, as: :price_cents

  def to_builder
    Jbuilder.new do |article|
      article.price stripe_price_id
      article.quantity 1
    end
  end

  after_create do
    product = Stripe::Product.create({ name: titre })
    price = Stripe::Price.create({ product: product.id, unit_amount: self.price, currency: self.currency })
    update(stripe_product_id: product.id, stripe_price_id: price.id)
  end


end
