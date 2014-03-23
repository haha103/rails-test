class BankBranch < ActiveRecord::Base
	belongs_to :bank
	has_one :province
	has_one :city
end
