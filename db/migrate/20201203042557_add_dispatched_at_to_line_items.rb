class AddDispatchedAtToLineItems < ActiveRecord::Migration[6.0]
  def change
    add_column :line_items, :dispatched_at, :datetime
  end
end
