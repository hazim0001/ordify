class CreateMenuItems < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_items do |t|
      t.string :title
      t.float :item_price, default: 0.0 # float need to be changed to integer with "money-rails" gem
      t.text :description
      t.references :restaurant, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.boolean :active, default: true


      t.timestamps
    end
  end
end
