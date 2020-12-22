class Order < ApplicationRecord
  belongs_to :table
  has_one :restaurant, through: :table

  has_many :line_items, dependent: :destroy
  has_many :menu_items, through: :line_items

  validates :user_number, presence: true

  monetize :total_price_cents

  # enum status: %i[paid]

  default_scope { where(order_deleted: false) }
  scope :not_paid, -> { where("status= ? AND total_price_cents> ?", "not paid", "0") }
  scope :not_paid_only, -> { where(status: "not paid") }

  def self.total_sum
    sum :total_price_cents
  end

  # def dispatched
  #   dispatched == true
  # end

  # def paid?
  #   status == "paid"
  # end
end
