class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @total = 0
    # @flag = cart_empty(@cart_items)
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    current_cart_item = current_customer.cart_items.find_by(item_id: @cart_item.item_id)
    if current_cart_item
      new_amount = current_cart_item.amount + @cart_item.amount.to_i
      current_cart_item.update(amount: new_amount)
      redirect_to cart_items_path
    else 
      @cart_item.save
      redirect_to cart_items_path
    end
  end
  
  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end
  
  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end
  
  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_path
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
  
  # def cart_empty(cart_items)
  #   cart_items.count == 0
  # end
  
end
