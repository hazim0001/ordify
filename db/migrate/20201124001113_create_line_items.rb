class CreateLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :line_items do |t|
      t.text :comment, default: "Standard"
      t.integer :quantity, default: 1
      t.boolean :ordered, default: false
      t.boolean :dispatched_from_kitchen, default: false
      t.references :order, null: false, foreign_key: true
      t.references :menu_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
