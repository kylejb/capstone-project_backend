class User < ApplicationRecord
    has_secure_password
    
    has_many :favorite_beaches
    has_many :beaches, through: :favorite_beaches
end
