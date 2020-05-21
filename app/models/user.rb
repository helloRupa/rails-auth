class User < ApplicationRecord
  # Let's ensure users have unique login names (usernames) since they log in with them
  # Let's also enforce minimum username and password lengths for safety
  validates :username, length: { minimum: 3 }, uniqueness: true
  validates :password, length: { minimum: 8 }
  
  has_secure_password
end
