class Cart < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  def tax_price
    (item.price * 1.1).floor
  end

  def subtotal
    tax_price * quantity
  end
end
