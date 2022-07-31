class CreateSippingAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :sipping_addresses do |t|
      t.integer :customer_id
      t.string :address
      t.string :zip_code
      t.string :name

      t.timestamps
    end
  end
end
