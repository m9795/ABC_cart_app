class Public::CartsController < ApplicationController
  def index
    @customer = current_customer
    @carts = @customer.carts
    @total = 0
  end

  def create
    cart = Cart.new(cart_params)
    cart.save
    redirect_to public_carts_path
  end

  def destroy
    cart = Cart.find(params[:id])
    cart.destroy
    redirect_to request.referer
  end

  private
  def cart_params
    params.require(:cart).permit(:customer_id, :item_id, :quantity)
  end
end
