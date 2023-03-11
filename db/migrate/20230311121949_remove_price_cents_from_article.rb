class RemovePriceCentsFromArticle < ActiveRecord::Migration[7.0]
  def change
    remove_column :articles, :price_cents, :integer
  end
end
