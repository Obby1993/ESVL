class AddColumnPublicIdToDocument < ActiveRecord::Migration[7.0]
  def change
    add_column :documents, :public_id, :string
  end
end
