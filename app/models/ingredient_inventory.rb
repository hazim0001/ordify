class IngredientInventory < ApplicationRecord
  has_many :ingredients
  has_many :menu_items, through: :ingredients
  has_many :inventory_refills
  has_many :extras
end
