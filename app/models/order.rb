class Order < ApplicationRecord
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  
  has_many :order_items, dependent: :destroy
  belongs_to :customer
  
  def add_tax_price
    (self.price * 1.10).round
  end
  
  def subtotal
    item.add_tax_price * amount
  end
  
  
  
end
