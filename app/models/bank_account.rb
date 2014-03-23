class BankAccount < ActiveRecord::Base
	has_one :bank_card_type
	has_one :bank
end
