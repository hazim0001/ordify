class CreateAddExtras < ActiveRecord::Migration[6.0]
  def change
    create_table :add_extras do |t|
      t.references :line_item, null: false, foreign_key: true
      t.references :extra, null: false, foreign_key: true

      t.timestamps
    end
  end
end
