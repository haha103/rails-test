class User < ActiveRecord::Base
	has_many :emails
	has_many :phones
	has_and_belongs_to_many :roles
end
