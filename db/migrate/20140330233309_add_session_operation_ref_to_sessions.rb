class AddSessionOperationRefToSessions < ActiveRecord::Migration
  def change
    add_reference :sessions, :session_operation, index: true
  end
end
