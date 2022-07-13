class CreateJanrus < ActiveRecord::Migration[6.1]
  def change
    create_table :janrus do |t|
      t.string :janru_name, null: false

      t.timestamps
    end
  end
end
