class LineItem < ApplicationRecord
  belongs_to :order
  belongs_to :menu_item

  validates :quantity, presence: true, inclusion: { in: (0..10) }, numericality: { only_integer: true }
  validates :comment, length: { maximum: 30 }

  monetize :total_cents

  default_scope { where(deleted: false) }
end
