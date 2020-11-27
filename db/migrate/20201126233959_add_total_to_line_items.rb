class AddTotalToLineItems < ActiveRecord::Migration[6.0]
  def change
    add_monetize :line_items, :total, currency: { present: false }
  end
end
