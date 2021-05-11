class Admin::OrderDetailsController < ApplicationController

   before_action :authenticate_admin!,except: [:top]


  def update
    puts params[:id]
    @orders_detail = OrdersDetail.find(params[:id])
      @orders_detail.update(orders_detail_params)
        redirect_to request.referer


  end


  private
    def orders_detail_params
      params.require(:orders_detail).permit(:order_id, :item_id, :price, :amount, :making_status)
    end

end
