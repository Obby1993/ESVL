class AddDisplayToArticle < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :display, :boolean, :default => false
  end
end
