class Product < ActiveRecord::Base
	has_one :borrower
	has_many :guarantees
	has_one :refund_type
	has_one :product_status
end
