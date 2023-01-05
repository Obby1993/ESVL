class AddNameToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :fonction, :string, null: false
  end
end
