class AddTotalsToCart < ActiveRecord::Migration[5.0]
  def change
    add_column :carts, :total, :float
  end
end
