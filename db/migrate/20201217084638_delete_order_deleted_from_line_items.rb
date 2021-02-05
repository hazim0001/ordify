class DeleteOrderDeletedFromLineItems < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :order_deleted, :boolean, default: false
    add_column :orders, :order_deleted_by, :string
    add_column :orders, :order_deleted_at, :datetime
  end
end
