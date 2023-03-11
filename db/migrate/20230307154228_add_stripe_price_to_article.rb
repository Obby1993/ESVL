class AddStripePriceToArticle < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :stripe_price_id, :string
  end
end
