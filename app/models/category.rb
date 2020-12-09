class Category < ApplicationRecord
  has_many :menu_items
  has_many :restaurants, through: :menu_items

  validates :title, presence: true
end
