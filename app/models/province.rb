class Province < ActiveRecord::Base
	has_many :cities
	has_many :districts, through: :cities
end
