class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password
  validates :name, :email, :password, :password_confirmation, :presence => true
  validates :email, :uniqueness => true
  validates :password, :password_confirmation, :length => { in: 4..20 }
end
