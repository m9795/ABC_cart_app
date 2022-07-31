class Public::CartsController < ApplicationController
  def index
    @customer = current_customer
    @carts = @customer.carts
    @total = 0
  end

  def create
    carts = current_customer.carts.where(item_id: params[:cart][:item_id])
    cart = current_customer.carts.new(cart_params)
    if carts.present?
      carts.each do |cart_item|
        cart.quantity += cart_item.quantity
        #もともとカートにある商品を削除
        cart_item.destroy
      end
    end
    cart.save
    redirect_to public_carts_path
  end

  def destroy
    cart = Cart.find(params[:id])
    cart.destroy
    redirect_to request.referer
  end

  def destory_all
    current_customer.carts.destroy_all
    redirect_to request.referer
  end

  private
  def cart_params
    params.require(:cart).permit(:customer_id, :item_id, :quantity)
  end
end
