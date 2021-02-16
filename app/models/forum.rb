class Forum < ApplicationRecord
  has_secure_password
  belongs_to :owner
end
