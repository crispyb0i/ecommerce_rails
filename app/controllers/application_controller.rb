class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order
  helper_method :current_total
  helper_method :current_item

  def current_order
    if session[:order_id]
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  def current_total
    @total = current_order.total_price
  end

  def current_item
    @order_items = current_order.order_items
  end

end
