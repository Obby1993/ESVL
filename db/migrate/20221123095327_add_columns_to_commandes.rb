class AddColumnsToCommandes < ActiveRecord::Migration[7.0]
  def change
    add_column :commandes, :etat, :string
    add_monetize :commandes, :amount, currency: { present: false }
    add_column :commandes, :checkout_session_id, :string
  end
end
