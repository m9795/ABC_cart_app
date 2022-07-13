class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @customer = Customer.find(params[:id])
    @item = Item.find(params[:id])
    @cart = Cart.new
  end

end
