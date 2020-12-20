class AddExtra < ApplicationRecord
  belongs_to :line_item
  belongs_to :extra
end
