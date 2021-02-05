class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :title
      t.integer :ingredient_portion_size_grams, default: 0
      t.references :menu_item, null: false, foreign_key: true
      t.references :ingredient_inventory, null: false, foreign_key: true

      t.timestamps
    end
  end
end
