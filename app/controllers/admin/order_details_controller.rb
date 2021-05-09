class Admin::OrderDetailsController < ApplicationController

   before_action :authenticate_admin!,except: [:top]


  def update
    @orders_detail = OrdersDetail.find(params[:id])
      @orders_detail.update(orders_detail_params)
        redirect_to admin_order_path(@orders_detail.order)

  end


  private
    def orders_detail_params
      params.require(:orders_detail).permit(:order_id, :item_id, :price, :amount, :making_status)
    end

end
