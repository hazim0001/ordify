class CreateInventories < ActiveRecord::Migration[6.0]
  def change
    create_table :inventories do |t|
      t.integer :stock_amount_grams
      t.integer :trigger_limit
      t.references :menu_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
