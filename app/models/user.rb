class User < ApplicationRecord
    has_many :favorite_beaches
    has_many :beaches, through: :favorite_beaches
    
    has_secure_password
end
