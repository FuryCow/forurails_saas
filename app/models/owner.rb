class Owner < ApplicationRecord
  has_secure_password
  has_many :forums
end
