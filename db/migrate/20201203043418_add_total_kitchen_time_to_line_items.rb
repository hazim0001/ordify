class AddTotalKitchenTimeToLineItems < ActiveRecord::Migration[6.0]
  def change
    add_column :line_items, :total_kitchen_time, :float, default: 0.0
  end
end
