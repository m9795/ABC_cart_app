class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
  end

  def confirm
    @order = Order.new(order_params)
    @order.save
    redirect_to public_orders_complete_path
  end

  def complete
    @customer = Customer.find(current_customer.id)
  end

  def create
  end

  def index
    @orders = Order.all
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :address)
  end
end
