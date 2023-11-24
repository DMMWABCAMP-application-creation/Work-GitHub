class Admin::HomesController < ApplicationController
  def top
    @order_page = Order.page(params[:page]).per(10)
    
  end
end
