class InventoryCheckJob < ApplicationJob
  queue_as :default

  def perform
    triggered_inventory = Inventory.where("trigger_limit > stock_amount_grams")
    triggered_inventory.each do |inventory|
      restaurant_manager = inventory.restaurant.employees.find_by(role: "manager").email
      message = "#{inventory.menu_item.title} is running low"
      InventoryMailer.submission(message, restaurant_manager).deliver
    end
  end
end
