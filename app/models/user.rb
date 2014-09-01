class User < ActiveRecord::Base
	has_secure_password

	attr_accessible :email, :password, :password_confirmation

	validates_uniqueness_of :email
	validates :password, length: { in 6..20 }

end
