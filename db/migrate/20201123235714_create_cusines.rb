class CreateCusines < ActiveRecord::Migration[6.0]
  def change
    create_table :cusines do |t|
      t.string :name

      t.timestamps
    end
  end
end
