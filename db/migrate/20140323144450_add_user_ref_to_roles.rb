class AddUserRefToRoles < ActiveRecord::Migration
  def change
    add_reference :roles, :user, index: true
  end
end
