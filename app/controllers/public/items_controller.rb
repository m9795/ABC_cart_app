class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @customer = current_customer
    @item = Item.find(params[:id])
    @cart = Cart.new
  end

end
