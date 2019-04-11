class AddAddresFieldsToCustomer < ActiveRecord::Migration[5.0]
  def change
    change_column_null :customers, :firstName, false
    change_column_null :customers, :lastName, false
    change_column_null :customers, :cpf, false
    add_column :customers, :street, :string, null: true
    add_column :customers, :number, :string, null: true
    add_column :customers, :complement, :string, null: true
    add_column :customers, :neighborhood, :string, null: true
    add_column :customers, :city, :string, null: true
    add_column :customers, :state, :string, null: true
    add_column :customers, :postalCode, :string, null: true
  end
end
