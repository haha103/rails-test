class AddColumnToPhones < ActiveRecord::Migration
  def change
    add_column :phones, :activation_code, :string
  end
end
