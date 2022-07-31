class Item < ApplicationRecord
  has_many :carts
  has_many :ordered_items

  has_one_attached :image
  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end
end
