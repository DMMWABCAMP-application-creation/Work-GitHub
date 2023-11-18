class Admin::HomesController < ApplicationController
  def top
    @order_item = OrderItem.all
    @order_page = OrderItem.page(params[:page]).per(10)
    
  end
end
