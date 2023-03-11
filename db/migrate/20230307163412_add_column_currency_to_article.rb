class AddColumnCurrencyToArticle < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :currency, :string, default: "eur"
  end
end
