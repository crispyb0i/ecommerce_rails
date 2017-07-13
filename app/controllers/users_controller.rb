class UsersController < ApplicationController
  def show
    @user = current_user
    @users_favorite_account = Account.where(user_id:current_user.id)
    @favorited_products = []
    @users_favorite_account[0].favorite.each do |favorite|
      @favorited_products.push(Product.find(favorite))
    end
  end

  def unfavorite2
    @account = Account.find_by user_id:current_user.id
    product_id = params[:user_id].to_i
    @product = Product.find(product_id)
    @account.favorite.delete(product_id)
    @account.save
  end
end
