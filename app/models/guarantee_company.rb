class GuaranteeCompany < ActiveRecord::Base
	has_many :guarantees
	has_many :products, through: :guarantees
end
