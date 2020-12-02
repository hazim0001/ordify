class AddPortionSizeGramsToMenuItems < ActiveRecord::Migration[6.0]
  def change
    add_column :menu_items, :portion_size_grams, :integer, default: 0
  end
end
