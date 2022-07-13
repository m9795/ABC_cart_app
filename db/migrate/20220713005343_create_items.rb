class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :janru_id
      t.integer :admin_id
      t.string :item_name, null: false
      t.text :item_introduction, null: false
      t.integer :price, null: false
      t.integer :sale_status, null: false

      t.timestamps
    end
  end
end
