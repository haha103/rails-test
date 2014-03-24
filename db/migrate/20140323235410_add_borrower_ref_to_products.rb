class AddBorrowerRefToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :borrower, index: true
  end
end
