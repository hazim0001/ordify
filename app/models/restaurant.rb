class Restaurant < ApplicationRecord
  has_many :tables
  has_many :employees
  has_many :menu_items
  has_many :line_items, through: :menu_items
  has_many :categories, through: :menu_items
  has_many :orders, through: :tables
  belongs_to :cusine
  has_one_attached :photo

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: true
end
