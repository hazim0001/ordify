class AddReceivedAtToLineItems < ActiveRecord::Migration[6.0]
  def change
    add_column :line_items, :received_at, :datetime
  end
end
