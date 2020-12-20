class LineItem < ApplicationRecord
  belongs_to :order
  belongs_to :menu_item

  has_many :add_extras
  has_many :extras, through: :add_extras

  validates :quantity, presence: true, inclusion: { in: (0..10) }, numericality: { only_integer: true }
  validates :comment, length: { maximum: 30 }

  monetize :total_cents

  default_scope { where(deleted: false) }
  scope :inside_order_no, ->(id) { where("order_id= ?", id).order(created_at: :desc) }
  scope :not_dispatched_from_kitchen, -> { where(dispatched_from_kitchen: false) }
  scope :ordered_and_not_dispatched, -> { where("ordered= ? AND dispatched_from_kitchen= ?", true, false).order(:created_at) }

  # def dispatched_from_kitchen
  #   dispatched_from_kitchen == true
  # end
end
