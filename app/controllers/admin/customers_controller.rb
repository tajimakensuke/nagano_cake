class Admin::CustomersController < ApplicationController

  before_action :authenticate_admin!,except: [:top]

  def index
    @customers = Customer.with_deleted
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer =Customer.find(params[:id])
     @customer.update(customer_params)
     redirect_to admin_customer_path
  end

private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana,
    :postal_code, :address, :telephone_number, :email, :is_deleted)
  end


end
