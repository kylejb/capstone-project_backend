class FavoriteBeach < ApplicationRecord
  belongs_to :beach
  belongs_to :user
end
