class Public::CartsController < ApplicationController
  def index
    customer_cart = current_customer.carts
    @carts = customer_cart.all
  end

  def create
    cart = Cart.new(cart_params)
    cart.save
    redirect_to public_items_path
  end

  private
  def cart_params
    params.require(:cart).permit(:customer_id, :item_id, :quantity)
  end
end
