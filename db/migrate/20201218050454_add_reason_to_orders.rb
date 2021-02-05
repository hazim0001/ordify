class AddReasonToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :deletion_reason, :text
  end
end
