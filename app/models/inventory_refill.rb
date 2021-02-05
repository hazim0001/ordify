class InventoryRefill < ApplicationRecord
  before_create :set_time_stamps
  before_update :set_time_stamps
  before_save :set_time_stamps

  belongs_to :ingredient_inventory

  def set_time_stamps
    self.inventory_refill_created_at = self.created_at
    self.inventory_refill_updated_at = self.updated_at
  end
end
