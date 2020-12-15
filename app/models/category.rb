class Category < ApplicationRecord
  has_many :menu_items, dependent: :destroy
  has_one :restaurants, through: :menu_items

  validates :title, presence: true
end
