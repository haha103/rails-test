class User < ActiveRecord::Base

	include BCrypt
	
	has_many :emails
	has_many :phones
	has_and_belongs_to_many :roles
	accepts_nested_attributes_for :emails
	accepts_nested_attributes_for :phones
	accepts_nested_attributes_for :roles

	#def login_pass
	#	@login_pass ||= Password.new(login_pass)
	#end

	#def login_pass=(p)
	#	@login_pass = Password.create(p)
	#	self.login_pass = @login_pass
	#end

	#def pay_pass
	#  @pay_pass ||= Password.new(pay_pass)
	#end

	#def pay_pass=(p)
	#	@pay_pass = Password.create(p)
	# self.pay_pass = @pay_pass
	#end
	
end
