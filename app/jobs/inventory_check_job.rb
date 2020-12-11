class InventoryCheckJob < ApplicationJob
  queue_as :default

  def perform
    triggered_inventory = Inventory.where("trigger_limit > stock_amount_grams")
    triggered_inventory.each do |inventory|
      puts "Your #{inventory.menu_item.title} is getting out of stock"
    end
  end
end
