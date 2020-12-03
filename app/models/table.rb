class Table < ApplicationRecord
  has_many :orders 
  has_many :line_items, through: :orders
  has_many :menu_items, through: :line_items
  belongs_to :restaurant

  validates :name, presence: true #, format: { with: /\b(table) (\d|\w*)\b/i }, uniqueness: { scope: restaurant_id }
end
