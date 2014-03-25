class User < ActiveRecord::Base
	has_many :emails
	has_many :phones
	has_and_belongs_to_many :roles
	accepts_nested_attributes_for :emails
	accepts_nested_attributes_for :phones
	accepts_nested_attributes_for :roles
end
