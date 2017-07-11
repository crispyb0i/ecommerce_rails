class User < ApplicationRecord
  has_one :account
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :register_account

  def register_account
    @user = User.last
    @account = Account.new(user_id: @user.id)
    @user.account = @account
    @user.save
    @account.save
  end
end
