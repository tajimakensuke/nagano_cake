class OrdersController < ApplicationController
  def new
    @address =current_customer.addresses
    @order = Order.new
  end

  def comfirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
      
  end


private
  def order_params
    params.require(:order).permit(:customers_id, :postal_code, :address, :name,
    :shipping_cost, :total_payment, :payment_method, :status)
  end

end