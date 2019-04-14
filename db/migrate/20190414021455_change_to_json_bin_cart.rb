class ChangeToJsonBinCart < ActiveRecord::Migration[5.0]
  def change
    remove_column :carts, :items
    add_column :carts, :items, :json
    
  end
end
