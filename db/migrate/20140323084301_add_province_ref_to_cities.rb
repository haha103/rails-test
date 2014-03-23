class AddProvinceRefToCities < ActiveRecord::Migration
  def change
    add_reference :cities, :province, index: true
  end
end
