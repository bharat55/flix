class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true,
              format:{:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i},
              uniqueness: true
  validates :username, presence: true, format:{:with => /\A[a-zA-Z0-9]+\Z/ },
              uniqueness: true

end
