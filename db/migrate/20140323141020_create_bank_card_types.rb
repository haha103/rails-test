class CreateBankCardTypes < ActiveRecord::Migration
  def change
    create_table :bank_card_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
