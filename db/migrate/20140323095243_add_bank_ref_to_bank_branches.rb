class AddBankRefToBankBranches < ActiveRecord::Migration
  def change
    add_reference :bank_branches, :bank, index: true
  end
end
