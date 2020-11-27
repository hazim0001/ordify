class CreateLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :line_items do |t|
      t.text :comment, default: ""
      t.integer :quantity, default: 1
      t.boolean :sent, default: false
      t.float :total, default: 0.0
      t.references :order, null: false, foreign_key: true
      t.references :menu_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
