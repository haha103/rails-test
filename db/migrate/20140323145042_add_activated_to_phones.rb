class AddActivatedToPhones < ActiveRecord::Migration
  def change
    add_column :phones, :activated, :boolean
  end
end
