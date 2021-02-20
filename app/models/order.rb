class Order < ApplicationRecord
  before_create :set_time_stamps
  before_update :set_time_stamps
  before_save :set_time_stamps

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
  scope :last_week, -> { where("order_created_at > ?", 1.week.ago) }
  scope :yesterday, -> { where("order_created_at > ?", 2.day.ago) }
  # scope :order_query, ->(query) { where(order_created_at: DateTime.iso8601(query)..Time.now) }

  def self.total_sum
    sum :total_price_cents
  end

  def self.order_query(query_start, query_end)
    where(order_created_at: (query_start..query_end))
    # where(order_created_at: DateTime.iso8601(query_start)..DateTime.iso8601(query_end))
  end

  private

  def set_time_stamps
    self.order_created_at = self.created_at
    self.order_updated_at = self.updated_at
  end
  # def paid?
  #   status == "paid"
  # end
end
