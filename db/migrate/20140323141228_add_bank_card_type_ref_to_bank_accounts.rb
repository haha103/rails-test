class AddBankCardTypeRefToBankAccounts < ActiveRecord::Migration
  def change
    add_reference :bank_accounts, :bank_card_type, index: true
  end
end
