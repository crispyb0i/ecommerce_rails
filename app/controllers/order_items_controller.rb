class OrderItemsController < ApplicationController
  def create
    if current_user
    @order = current_order
    @item = @order.order_items.new(item_params)
    @order.account_id = current_user.id
    @order.save
    session[:order_id] = @order.id
    redirect_to products_path
    else
    redirect_to user_session_path
    end
  end

  def destroy
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.destroy
    @order.save
    respond_to do |format|
      format.html {redirect_to cart_path}
      format.js
    end
  end

  private

 def item_params
   params.require(:order_item).permit(:quantity, :product_id)
 end
end
