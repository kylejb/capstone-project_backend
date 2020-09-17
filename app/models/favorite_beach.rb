class FavoriteBeach < ApplicationRecord
  belongs_to :user
  belongs_to :beach
  has_many :buoys, through: :beach
end
