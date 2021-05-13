class Admin::OrderDetailsController < ApplicationController

   before_action :authenticate_admin!,except: [:top]


  def update
    puts params[:id]
    @orders_detail = OrdersDetail.find(params[:id])


      if @orders_detail.update(making_status: "creating")
        @orders_detail.order.update(status: "creating")
      end

      @orders_detail.update(orders_detail_params)
        redirect_to request.referer


  end


  private
    def orders_detail_params
      params.require(:orders_detail).permit(:order_id, :item_id, :price, :amount, :making_status)
    end

    def order_params
      params.require(:order).permit(:customer_id, :postal_code, :address, :name,
      :shipping_cost, :total_payment, :payment_method, :status)
    end

end
