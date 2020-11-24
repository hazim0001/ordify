class Order < ApplicationRecord
  has_many :line_items
  has_many :menu_items, through: :line_items
  belongs_to :table
  has_one :restaurant, through: :table
  validates :user_number, presence: true
end
