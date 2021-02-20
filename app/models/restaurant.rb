class Restaurant < ApplicationRecord
  has_many :employees
  has_many :menu_items
  has_many :tables
  has_many :categories
  has_many :orders, through: :tables
  has_many :line_items, through: :menu_items
  # has_many :ingredients, through: :menu_items
  # has_many :ingredient_inventories, through: :ingredients

  belongs_to :cusine

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: true
end
