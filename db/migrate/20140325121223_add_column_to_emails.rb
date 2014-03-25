class AddColumnToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :activation_code, :string
  end
end
