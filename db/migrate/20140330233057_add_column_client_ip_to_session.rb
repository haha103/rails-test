class AddColumnClientIpToSession < ActiveRecord::Migration
  def change
    add_column :sessions, :client_ip, :string
  end
end
