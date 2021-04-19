class CustomersController < ApplicationController

  def  show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])

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
    @customer.update(is_active: "Invalid")
    reset_session
    redirect_to root_path
  end

private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
    :postal_code, :address, :telephone_number, :email)
  end

end