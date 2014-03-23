class AddProvinceRefToBankBranches < ActiveRecord::Migration
  def change
    add_reference :bank_branches, :province, index: true
  end
end
