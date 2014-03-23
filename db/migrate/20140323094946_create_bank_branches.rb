class CreateBankBranches < ActiveRecord::Migration
  def change
    create_table :bank_branches do |t|
      t.string :name

      t.timestamps
    end
  end
end
