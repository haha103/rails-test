class AddProductStatusRefToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :product_status, index: true
  end
end
