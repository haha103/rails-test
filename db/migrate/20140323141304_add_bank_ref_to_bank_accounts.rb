class AddBankRefToBankAccounts < ActiveRecord::Migration
  def change
    add_reference :bank_accounts, :bank, index: true
  end
end
