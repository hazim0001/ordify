class MenuItem < ApplicationRecord
  has_one :inventory, dependent: :destroy
  has_many :line_items
  has_many :orders, through: :line_items
  has_many :tables, through: :orders
  has_many_attached :photos

  has_many :ingredients
  has_many :ingredient_inventories, through: :ingredients
  has_many :inventory_refills, through: :ingredient_inventories

  belongs_to :restaurant
  belongs_to :category

  validates :title, presence: true, length: { in: 3..150 } # , uniqueness: { scope: restaurant_id }
  validates :description, presence: true, length: { in: 10..150 } # max to be checked when we have the menu_item card

  monetize :item_price_cents

  scope :active_and_related, ->(restaurant, category) { where(restaurant: restaurant).where(category: category).where(active: true) }
  scope :active, -> { where(active: true) }
end
