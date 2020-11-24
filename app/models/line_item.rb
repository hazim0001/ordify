class LineItem < ApplicationRecord
  belongs_to :order
  belongs_to :menu_item
  validates :quantity, presence: true, inclusion: { in: (1..10) }, numericality: { only_integer: true }
  validates :comment, length: { maximum: 30 }
end
