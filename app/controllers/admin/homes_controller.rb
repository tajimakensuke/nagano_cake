class Admin::HomesController < ApplicationController
  
   before_action :authenticate_admin!,except: [:top]

  def top
    @orders = Order.all
  end

end
