class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :number
      t.string :complement
      t.string :city
      t.string :state
      t.string :postalCode
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
