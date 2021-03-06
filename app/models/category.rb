class Category < ApplicationRecord
  has_many :menu_items, dependent: :destroy #, counter_cache: true
  belongs_to :restaurant

  validates :title, presence: true
end
