class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart = Cart.new
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
