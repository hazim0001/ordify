class CreateMenuItems < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_items do |t|
      t.string :title
      t.text :description
      t.references :restaurant, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.boolean :active, default: true


      t.timestamps
    end
  end
end
