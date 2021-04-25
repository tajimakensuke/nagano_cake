class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all.page(params[:page]).per(8)
  end



end
