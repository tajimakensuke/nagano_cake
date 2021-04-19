class AddressesController < ApplicationController

  def index
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    

    @address.save
      redirect_to addresses_path, notice: 'Task is create'

  end


private


  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end
end
