class ChargesController < ApplicationController
  def new
    @amount = current_order.total_price
    @cents = current_order.total_price * 100
  end

  def create
    # Amount in cents
    @amount = current_order.total_price.to_f
    @cents = (@amount * 100).to_i
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @cents,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )
    current_order.order_items.destroy_all

  rescue Stripe::CardError => e
    flash[:error] = e.message

    redirect_to new_charge_path
  end
end
