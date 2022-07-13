class Public::CartsController < ApplicationController
  def index
    @carts = Cart.all
  end
end
