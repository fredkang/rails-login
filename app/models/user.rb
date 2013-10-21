class User < ActiveRecord::Base

	has_many :scomments, class_name: "Comment", foreign_key: "author_id"
	has_many :rcomments, class_name: "Comment", foreign_key: "user_id"

	validates 	:email,	:presence		=> true,
				:email_format 			=> {message: "Invalid email address"},
				:uniqueness				=> {case_sensitive:false, message: "This email already exists"}
	validates	:name, :presence		=> true
	validates	:password, :presence	=> true,
				:length					=> {in: 3..40}

	before_save{ self.email.downcase! }
	has_secure_password

	# def password
	# 	@password ||= Password.new(password_hash)
	# end

	# def password=(new_password)
	# 	@password = Password.create(new_password)
	# 	self.password_hash = @password
	# end
end
