class AddIngredientInventoryToExtras < ActiveRecord::Migration[6.0]
  def change
    add_reference :extras, :ingredient_inventory, null: true, foreign_key: true
  end
end
