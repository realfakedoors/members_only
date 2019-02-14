class User < ApplicationRecord

	attr_accessor :remember_token

	before_save 	:downcase_email

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  
  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

	# Creates a hash digest of the given string.
	def User.digest(string)
		BCrypt::Password.create(string)
	end

	# Creates a random urlsafe token.
	def User.new_token
		SecureRandom.urlsafe_base64
	end

	# Gives the user a remember token and digest.
	def remember_user
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end

	private

		# Changes the user's email to all lower-case.
		def downcase_email
			email.downcase!
		end

end