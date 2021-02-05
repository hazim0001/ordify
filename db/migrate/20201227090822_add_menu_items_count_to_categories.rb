class AddMenuItemsCountToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :menu_items_count, :integer, default: 0
  end
end
