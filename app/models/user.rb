class User < ApplicationRecord
    has_secure_password
  
    validates :first_name, :last_name, :email, :birthdate, :phone, :country, presence: true
    validates :email, uniqueness: true
    validates :password, length: { minimum: 6 }
end