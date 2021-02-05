class AddDeletedToLineItems < ActiveRecord::Migration[6.0]
  def change
    add_column :line_items, :deleted, :boolean, default: false
    add_column :line_items, :deleted_by, :string
    add_column :line_items, :deleted_at, :datetime
  end
end
