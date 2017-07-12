class AddFavorite < ActiveRecord::Migration[5.1]
  def change
    remove_column(:accounts, :favorite)
  end
end
