class Ingredient < ApplicationRecord
  belongs_to :menu_item
  belongs_to :ingredient_inventory

  # has_many :inventory_refills, through: :ingredient_inventory
end
