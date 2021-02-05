class AddRestaurantToCategories < ActiveRecord::Migration[6.0]
  def change
    add_reference :categories, :restaurant, null: true, foreign_key: true
  end
end
