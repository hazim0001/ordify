class DeleteOrderDeletedFromLineItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :line_items, :order_deleted, :boolean, default: false
    remove_column :line_items, :order_deleted_by, :string
    remove_column :line_items, :order_deleted_at, :datetime

    add_column :orders, :order_deleted, :boolean, default: false
    add_column :orders, :order_deleted_by, :string
    add_column :orders, :order_deleted_at, :datetime
  end
end
