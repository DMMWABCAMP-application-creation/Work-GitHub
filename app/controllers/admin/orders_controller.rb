class Admin::OrdersController < ApplicationController
  def show
    @order_item = OrderItem.find(params[:id])
    @order_items = OrderItem.all
  end
end
