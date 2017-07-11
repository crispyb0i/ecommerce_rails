class UsersController < ApplicationController
  def show
    @user = current_user
    @order_items = current_order.order_items
    @total = current_order.total_price
  end
end
