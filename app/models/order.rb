class Order < ApplicationRecord
  has_many :carts
  enum payment_method: {credit_card: 0, transfer: 1 }
end
