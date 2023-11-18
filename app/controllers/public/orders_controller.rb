class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
  end
  
  def create
    
    order = Order.new(order_params)
    order.save
    @cart_items = current_customer.cart_items
    
    @cart_items.each do |cart_item|
      @order_item = OrderItem.new
      @order_item.order_id = order.id
      @order_item.item_id = cart_item.item.id
      @order_item.price = cart_item.item.add_tax_price
      @order_item.amount = cart_item.amount
      
      @order_item.save!
    end
    
    CartItem.destroy_all
    redirect_to orders_complete_path
    
  end
  
  def confilm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @order.postal_code = current_customer.postal_code
    @order.name = current_customer.last_name + current_customer.first_name
  end
  
  def complete
  end

  def index
  end

  def show
    @order = Order.find(params[:id])
    @order_item = OrderItem.find(params[:id])
  end
  
  
  private
  
  def cart_items_params
    params.repuire(:cart_item).permit(:item_id, :amount)
  end
  
  def order_params
    params.require(:order).permit(:payment_method, :customer_id, :postage, :postal_code, :billed_amount, :address, :name)
  end
  
  
  
  
end