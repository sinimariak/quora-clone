class User < ActiveRecord::Base
	has_many :questions
	has_many :answers

validates :email, format: {:with => /[^@\s]+@[^@\s]+.+[^@\s]/, :message => "Please enter a valid email address."}
validates :encrypted_password, length: {:minimum => 8, :message => "Please enter a password that is at least 8 characters long."}

	def password=(password)
		self.encrypted_password = BCrypt::Password.create(password)
	end

	def authenticate(password)
		if BCrypt::Password.new(self.encrypted_password) == password
			return true
		else 
			return false
		end
	end

end