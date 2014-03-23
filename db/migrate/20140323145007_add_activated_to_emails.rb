class AddActivatedToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :activated, :boolean
  end
end
