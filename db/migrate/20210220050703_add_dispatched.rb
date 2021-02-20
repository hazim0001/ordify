class AddDispatched < ActiveRecord::Migration[6.0]
  def change
    add_column :line_items, :dispatched_from_kitchen, :boolean, default: false
  end
end
