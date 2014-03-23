class AddCityRefToDistricts < ActiveRecord::Migration
  def change
    add_reference :districts, :city, index: true
  end
end
