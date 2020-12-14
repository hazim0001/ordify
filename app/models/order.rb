class Order < ApplicationRecord
  belongs_to :table
  has_one :restaurant, through: :table

  has_many :line_items, dependent: :destroy
  has_many :menu_items, through: :line_items

  validates :user_number, presence: true

  monetize :total_price_cents
end
