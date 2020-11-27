class User < ApplicationRecord
    has_secure_password
    
    has_many :entries, inverse_of: :user
    accepts_nested_attributes_for :entries, allow_destroy: true

    has_many :favorite_beaches
    # has_many :beaches, through: :favorite_beaches

    has_many :favorite_buoys
    # accepts_nested_attributes_for :favorite_buoys, allow_destroy: true
end
