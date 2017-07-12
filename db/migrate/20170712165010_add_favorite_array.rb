class AddFavoriteArray < ActiveRecord::Migration[5.1]
  def change
  add_column(:accounts, :favorite,:integer,:array => true, :default => [])
  end
end
