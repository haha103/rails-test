class AddRefundTypeRefToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :refund_type, index: true
  end
end
