class Category < ApplicationRecord
  has_many :menu_items, dependent: :destroy
  belongs_to :restaurant

  validates :title, presence: true
end
