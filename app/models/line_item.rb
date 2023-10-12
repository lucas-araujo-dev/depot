class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  def total_price
    product.price * quantity
  end

  def destroy
    if quantity > 1
      self.quantity -= 1
      save!
    else
      super
    end
  end
end
