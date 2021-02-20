class LineItem < ApplicationRecord
  before_create :set_time_stamps
  before_update :set_time_stamps
  before_save :set_time_stamps

  belongs_to :order
  belongs_to :menu_item
#
  # has_many :add_extras, dependent: :destroy
  # has_many :extras, through: :add_extras
  # has_many :ingredients, through: :menu_item

  validates :quantity, presence: true, inclusion: { in: (0..10) }, numericality: { only_integer: true }
  validates :comment, length: { maximum: 30 }

  monetize :total_cents

  default_scope { where(deleted: false) } # self.unscoped(codee \hereee)
  scope :inside_order_no, ->(id) { where("order_id= ?", id).order(created_at: :desc) }
  scope :not_dispatched_from_kitchen, -> { where(dispatched_from_kitchen: false) }
  scope :ordered_and_not_dispatched, -> { where("ordered= ? ", true).order(:created_at) }

  private

  def set_time_stamps
    self.line_item_created_at = self.created_at
    self.line_item_updated_at = self.updated_at
  end
end
