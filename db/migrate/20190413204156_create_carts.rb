class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')
    create_table :carts do |t|
      t.belongs_to :customer, foreign_key: true
      t.hstore 'items'
      t.timestamps
    end
  end
end
