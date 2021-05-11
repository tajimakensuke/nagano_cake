class Admin::ItemsController < ApplicationController

   before_action :authenticate_admin!,except: [:top]

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
    @genre = Genre.all
    if @item.save
      redirect_to admin_item_path(@item.id)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genre = Genre.all
  end

  def update
    @item = Item.find(params[:id])
    @genre = Genre.all
    @item.update(item_params)
      redirect_to admin_items_path
  end




private
  def item_params
    params.require(:item).permit(:genre_id, :name, :image, :introduction,
    :price, :is_active)
  end


end