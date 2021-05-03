class Public::HomesController < ApplicationController

  def about
  end

  def top
    @items = Item.limit(5)
  end

end
