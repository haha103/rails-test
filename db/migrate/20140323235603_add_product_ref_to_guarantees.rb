class AddProductRefToGuarantees < ActiveRecord::Migration
  def change
    add_reference :guarantees, :product, index: true
  end
end
