class AddPriceToArticles < ActiveRecord::Migration[7.0]
  def change
    add_monetize :articles, :price, currency: { present: false }
  end
end
