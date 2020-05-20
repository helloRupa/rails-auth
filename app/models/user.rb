class User < ApplicationRecord
  # When using database constraints in migrations, must add validations
  # to ensure save doesn't throw exceptions when creating entries
  validates :username, uniqueness: true
  validates :password, length: { minimum: 8 } # Let's force users to have longer passwords for safety
  has_secure_password
end
