class User < ActiveRecord::Base
	has_secure_password

	has_many :bookmarks
	has_many :topics

	validates_uniqueness_of :email
	validates :password, length: { in: 6..20 }

end
