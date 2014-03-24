class Guarantee < ActiveRecord::Base
	has_one :guarantee_company
	belongs_to :product
end
