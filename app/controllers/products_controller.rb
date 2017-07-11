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
  end

  def create
  end

  def new
  end

  def delete
  end
end
