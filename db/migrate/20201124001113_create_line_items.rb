class CreateLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :line_items do |t|

      t.timestamps
    end
  end
end
