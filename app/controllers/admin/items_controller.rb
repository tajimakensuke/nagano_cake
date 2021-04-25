class Admin::ItemsController < ApplicationController

  def index
    @item = Item.new
    @items = Item.all
  end

  def new
    @item = Item.new
    @genre = Genre.all
  end

  def create
    @item = Item.new(item_params)

    @item.save
      redirect_to admin_items_path
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genre = Genre.all
  end

  def update

  end




private
  def item_params
    params.require(:item).permit(:genre_id, :name, :image, :introduction,
    :price, :is_active )
  end


end