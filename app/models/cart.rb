class Cart < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  # def tax_price
  #   item
end
