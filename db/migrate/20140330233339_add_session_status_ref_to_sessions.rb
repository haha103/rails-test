class AddSessionStatusRefToSessions < ActiveRecord::Migration
  def change
    add_reference :sessions, :session_status, index: true
  end
end
