class Extra < ApplicationRecord
  monetize :extra_price_cents

  belongs_to :ingredient_inventory
end
