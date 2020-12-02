class MenuItem < ApplicationRecord
  has_many :line_items
  has_many :orders, through: :line_items
  has_many :tables, through: :orders
  belongs_to :restaurant
  belongs_to :category
  has_many_attached :photos
  has_one :inventory
  # attr_accessor :remove_photos

  validates :title, presence: true, length: { in: 3..150 } #, uniqueness: { scope: restaurant_id }
  validates :description, presence: true, length: { in: 10..500 } # max to be checked when we have the menu_item card
  monetize :item_price_cents
end
