class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    @customer.update(customer_params)
    redirect_to public_customers_my_page_path
  end

  def out_check
    @customer = Customer.find(current_customer.id)
  end

  def out
    @customer = Customer.find(current_customer.id)
    @customer.update(customer_params)
    reset_session
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postcode, :adress, :phone_namber, :is_deleted)
  end
end
