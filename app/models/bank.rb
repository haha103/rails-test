class Bank < ActiveRecord::Base
	has_many :bank_branches
end
