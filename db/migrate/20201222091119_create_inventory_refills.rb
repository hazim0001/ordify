class CreateInventoryRefills < ActiveRecord::Migration[6.0]
  def change
    create_table :inventory_refills do |t|
      t.integer :refill_amount, default: 0
      t.references :ingredient_inventory, null: false, foreign_key: true

      t.timestamps
    end
  end
end
