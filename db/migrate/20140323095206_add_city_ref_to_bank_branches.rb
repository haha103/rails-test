class AddCityRefToBankBranches < ActiveRecord::Migration
  def change
    add_reference :bank_branches, :city, index: true
  end
end
