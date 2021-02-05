class CreateExtras < ActiveRecord::Migration[6.0]
  def change
    create_table :extras do |t|
      t.string :title
      t.boolean :active_extra, defualt: true
      t.integer :size_grams

      t.timestamps
    end
  end
end
