class Article < ApplicationRecord
  has_many :commandes, dependent: :destroy
  belongs_to :event, optional: true
  monetize :price_cents


  def to_builder
    Jbuilder.new do |article|
      article.stripe_price_id
      article.quantity 1
    end
  end

  after_create do
    article = Stripe::Product.create({ name: titre })
    price = Stripe::Price.create(product: article, unit_amount: article.price_cents, currency: article.currency)
    update(stripe_product_id: article.id, stripe_price_id: price.id)
  end


end
