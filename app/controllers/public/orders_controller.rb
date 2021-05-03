class Public::OrdersController < ApplicationController

  def new
    @addresses =current_customer.addresses
    @order = Order.new
    @name = current_customer.first_name + current_customer.last_name
  end

  def comfirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @cart_items = current_customer.cart_items
    @total = 0
    @cart_items.each do |cart_item|
    @total += cart_item.item.price * cart_item.amount
    @order.status = :waiting
    end
    @order.shipping_cost = 800
    @order.total_payment = @total + 800

    if params[:order][:address_option] == "1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name

    elsif params[:order][:address_option] == "2"
      @address = Address.find(params[:order][:address_collection].to_i)
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name

    elsif params[:order][:address_option] == "3"

    end

  end

  def create
    @order = Order.new(order_params)
    @order.save
    @cart_items = current_customer.cart_items


    @cart_items.each do |cart_item|
    @order_detail = OrdersDetail.new
    @order_detail.order_id = @order.id
    @order_detail.item_id = cart_item.item_id
    @order_detail.amount = cart_item.amount
    @order_detail.price = cart_item.item.price
    @order_detail.making_status = :impossible
    @order_detail.save
    end

    @cart_items.destroy_all
      redirect_to complete_orders_path
  end

  def complete
  end


  def index

    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrdersDetail.all
  end



private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name,
    :shipping_cost, :total_payment, :payment_method, :status)
  end

end