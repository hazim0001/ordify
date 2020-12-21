class RenameIngredientInIngredients < ActiveRecord::Migration[6.0]
  def change
    remove_column :ingredients, :ingerdient_portion_size_grams, :integer
    add_column :ingredients, :ingredient_portion_size_grams, :integer
  end
end
