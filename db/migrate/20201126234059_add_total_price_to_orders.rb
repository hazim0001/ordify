class AddTotalPriceToOrders < ActiveRecord::Migration[6.0]
  def change
    add_monetize :orders, :total_price, currency: { present: false }
  end
end
