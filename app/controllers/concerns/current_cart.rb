# frozen_string_literal: true

module CurrentCart
  private

  def set_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    # if there is no cart in the session, create a new one
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end
end
