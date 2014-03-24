class CreateRefundTypes < ActiveRecord::Migration
  def change
    create_table :refund_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
