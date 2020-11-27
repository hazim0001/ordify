class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.boolean :dispatched, default: false
      t.references :table, null: false, foreign_key: true
      t.string :user_number
      t.boolean :sent, default: false
      t.float :total_price, default: 0.0
      t.string :status, default: 'not paid'
      t.string :checkout_session_id

      t.timestamps
    end
  end
end
