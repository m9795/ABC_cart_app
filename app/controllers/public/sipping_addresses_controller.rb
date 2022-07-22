class Public::SippingAddressesController < ApplicationController
  def index
    @sipping_address = SippingAddress.new
    @sipping_addreses = SippingAddress.all
  end

  def create
    @sipping_address = SippingAddress.new(sipping_address_params)
    @sipping_address.save
    redirect_to public_sipping_addresses_index_path
  end

  def edit
  end

  private
  def sipping_address_params
    params.require(:sipping_addresses).permit(:customer_id, :address, :zip_code, :name)
  end
end
