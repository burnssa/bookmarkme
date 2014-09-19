class User < ActiveRecord::Base
	has_secure_password

	has_many :bookmarks
	has_many :topics

	validates_uniqueness_of :email
	validates :password, length: { in: 6..20 }

	after_create :send_confirmation_email

	private

	def send_confirmation_email
		# send confirmation instructions
	end

end
