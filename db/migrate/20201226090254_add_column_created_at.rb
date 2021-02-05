class AddColumnCreatedAt < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :order_created_at, :datetime
    add_column :orders, :order_updated_at, :datetime

    add_column :line_items, :line_item_created_at, :datetime
    add_column :line_items, :line_item_updated_at, :datetime

    add_column :add_extras, :add_extra_created_at, :datetime
    add_column :add_extras, :add_extra_updated_at, :datetime

    add_column :inventory_refills, :inventory_refill_created_at, :datetime
    add_column :inventory_refills, :inventory_refill_updated_at, :datetime

  end
end
