class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart, optional: true
  belongs_to :order, optional: true

  def total_price
    product.price * quantity
  end


  private

  def decrement_or_destroy
    quantity > 1 ? decrement_quantity : destroy
  end
  def decrement_quantity
    self.quantity -= 1
    save!
  end

end
