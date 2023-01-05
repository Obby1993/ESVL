class AddPriceToEvents < ActiveRecord::Migration[7.0]
  def change
    add_monetize :events, :price, currency: { present: false }
    remove_column :events, :prix_inscription
  end
end
