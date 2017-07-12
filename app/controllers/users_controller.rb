class UsersController < ApplicationController
  def show
    @user = current_user
  #   @order = Order.find(current_user.id)
  #   @order_items = @order.order_items.all
  #
  #   product_ids = [];
  #   @product = []
  #   @order_items.each do |order_item|
  #     product_ids.push(order_item.product_id)
  #   end
  #   product_ids.each do |product_id|
  #
  #   product.push(Product.find(product_id))
  #   end
  # binding.pry
  end
end
