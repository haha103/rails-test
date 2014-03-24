class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :target_amount
      t.integer :target_amount_min
      t.float :interest_platform
      t.float :interest_investor
      t.date :invest_start
      t.date :invest_end
      t.date :refund_date
      t.string :purpose_summary
      t.text :purpose_detail

      t.timestamps
    end
  end
end
