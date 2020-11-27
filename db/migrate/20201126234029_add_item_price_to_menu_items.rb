class AddItemPriceToMenuItems < ActiveRecord::Migration[6.0]
  def change
    add_monetize :menu_items, :item_price, currency: { present: false }
  end
end
