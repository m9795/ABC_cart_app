class Public::CartsController < ApplicationController
  def index
    @customer = current_customer
    @carts = @customer.carts
  end

  def create
    cart = Cart.new(cart_params)
    cart.save
    redirect_to public_customer_carts_path
  end

  private
  def cart_params
    params.require(:cart).permit(:customer_id, :item_id, :quantity)
  end
end
