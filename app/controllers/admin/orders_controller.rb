class Admin::OrdersController < ApplicationController

   before_action :authenticate_admin!,except: [:top]

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.orders_details

      if @order.update(status: "confirmation")
        @order_details.each do |orders_detail|
          orders_detail.update(making_status: "waiting")
        end
      end


     @order.update(order_params)
      redirect_to top_admin_homes_path
  end


  private
    def orders_details_params
      params.require(:orders_detail).permit(:order_id, :item_id, :price, :amount, :making_status)
    end

    def order_params
      params.require(:order).permit(:customer_id, :postal_code, :address, :name,
      :shipping_cost, :total_payment, :payment_method, :status)
    end

end


