class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def index
    @items = Item.all.page(params[:page]).per(8)
  end




private
  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id, :customer_id)
  end

end
