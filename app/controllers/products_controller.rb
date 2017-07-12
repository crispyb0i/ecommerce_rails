class ProductsController < ApplicationController
  def index
    @products = Product.all
    @order_item = current_order.order_items.new
    @order_items = current_order.order_items.all
    @total = current_order.total_price
  end

  def show
    @product = Product.find(params[:id])
    @order_items = current_order.order_items.all
    @total = current_order.total_price
    @account = Account.find_by user_id:current_user.id
  end

  def create
  end

  def new
  end

  def delete
  end

  def favorite
    @account = Account.find_by user_id:current_user.id
    product_id = params[:id].to_i
    @product = Product.find(product_id)
    @account.favorite.push(product_id)
    @account.save
    respond_to do |format|
      format.html { redirect_to product_path(current_user)}
      format.js
    end

  end

  def unfavorite
    @account = Account.find_by user_id:current_user.id
    product_id = params[:id].to_i
    @product = Product.find(product_id)
    @account.favorite.delete(product_id)
    @account.save
    respond_to do |format|
      format.html { redirect_to product_path(current_user)}
      format.js
    end
  end
end
