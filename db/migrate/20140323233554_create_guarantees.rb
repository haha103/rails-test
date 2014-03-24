class CreateGuarantees < ActiveRecord::Migration
  def change
    create_table :guarantees do |t|
			t.string :contract_code
      t.string :letter_code
      t.string :letter_scan

      t.timestamps
    end
  end
end
