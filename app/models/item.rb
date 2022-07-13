class Item < ApplicationRecord
  belongs_to :admin  
  has_many :carts
end
