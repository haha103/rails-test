class RemoveUserRefFromRoles < ActiveRecord::Migration
  def change
    remove_reference :roles, :user, index: true
  end
end
