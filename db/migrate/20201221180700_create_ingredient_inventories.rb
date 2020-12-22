class CreateIngredientInventories < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredient_inventories do |t|
      t.integer :stock_amount_grams, default: 0
      t.integer :trigger_limit, default: 0
      t.string :name
      t.string :vendor_name
      t.string :vendor_phone_number
      t.timestamps
    end
  end
end
