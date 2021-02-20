class DropTables < ActiveRecord::Migration[6.0]
  def change
    drop_table :ingredients
    drop_table :add_extras
    drop_table :extras
    drop_table :inventory_refills
    drop_table :ingredient_inventories
  end
end
