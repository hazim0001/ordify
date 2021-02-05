class RemoveTimeInRestaurantToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :from_order_to_checkout, :integer
  end
end
