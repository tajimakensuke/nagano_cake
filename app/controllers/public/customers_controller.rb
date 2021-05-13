class Public::CustomersController < ApplicationController
  
  before_action :authenticate_customer!,except: [:top]

  def  show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)

    if @customer.update(customer_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to customer_path(@customer.id)
    else
    render action: :edit
    end

  end

  def unsubcribe

  end

  def withdraw
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleted: "true")
    @customer.destroy
      reset_session
      redirect_to root_path
  end

private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
    :postal_code, :address, :telephone_number, :email, :is_deleted)
  end

end