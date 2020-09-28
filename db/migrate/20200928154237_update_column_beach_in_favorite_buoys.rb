class UpdateColumnBeachInFavoriteBuoys < ActiveRecord::Migration[6.0]
  def change
    remove_reference :favorite_buoys, :beach
  end
end
