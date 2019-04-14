class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.belongs_to :customer, foreign_key: true
      t.json 'customer'
      t.json 'address'
      t.json 'items'
      t.integer 'total_qty'
      t.float 'total_price'
      t.timestamps
    end
  end
end
