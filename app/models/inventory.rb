class Inventory < ApplicationRecord
  belongs_to :menu_item
  has_one :restaurant, through: :menu_item
end
