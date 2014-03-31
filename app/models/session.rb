class Session < ActiveRecord::Base
	belongs_to :session_operation
	belongs_to :session_status
	belongs_to :user
end
