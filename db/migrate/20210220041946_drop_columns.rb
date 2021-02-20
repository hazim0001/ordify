class DropColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :employees, :salary
    remove_column :line_items, :dispatched_from_kitchen
    remove_column :line_items, :dispatched_at
    remove_column :orders, :from_order_to_checkout
    remove_column :orders, :checkout_session_id
  end
end
