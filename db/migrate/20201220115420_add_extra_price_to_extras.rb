class AddExtraPriceToExtras < ActiveRecord::Migration[6.0]
  def change
    add_monetize :extras, :extra_price, currency: { present: false }
  end
end
