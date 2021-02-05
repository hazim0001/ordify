class AddReasonToLineItems < ActiveRecord::Migration[6.0]
  def change
    add_column :line_items, :line_deletion_reason, :text
  end
end
