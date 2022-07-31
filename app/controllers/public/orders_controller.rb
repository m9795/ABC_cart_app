class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
  end

  def confirm
    @customer = Customer.find(current_customer.id)
    # @order.save
    @order = Order.new(order_params)
    if params[:order][:adress_option] == "0"
      # @order.zip_code = current_customer.zip_code
      # @order.name = current_customer.full_name
      # @order.adress = current_customer.adress
    end
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    current_customer.carts.each do |cart_item|
      @ordered_item = OrderedItem.new
      @ordered_item.item_id = cart_item.item_id
      @ordered_item.quantity = cart_item.quantity
      @ordered_item.order_id = @order.id
      @ordered_item.save
    end

    current_customer.carts.destroy_all
    redirect_to complete_public_orders_path
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
