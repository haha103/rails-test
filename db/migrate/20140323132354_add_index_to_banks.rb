class AddIndexToBanks < ActiveRecord::Migration
  def change
    #add_column :banks, :name, :string
    add_index :banks, :name, unique: true
  end
end
