class AddEventToArticle < ActiveRecord::Migration[7.0]
  def change
    add_reference :articles, :event
  end
end
