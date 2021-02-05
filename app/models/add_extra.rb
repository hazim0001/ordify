class AddExtra < ApplicationRecord
  before_create :set_time_stamps
  before_update :set_time_stamps
  before_save :set_time_stamps

  belongs_to :line_item
  belongs_to :extra

  def set_time_stamps
    self.add_extra_created_at = self.created_at
    self.add_extra_updated_at = self.updated_at
  end
end
