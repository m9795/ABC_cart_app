class Item < ApplicationRecord
  has_many :carts

  has_one_attached :image
  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end
end
