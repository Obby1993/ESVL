class AddColumnStripeProductToArticle < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :stripe_product_id, :string
  end
end
