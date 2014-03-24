class AddGuaranteeCompanyRefToGuarantees < ActiveRecord::Migration
  def change
    add_reference :guarantees, :guarantee_company, index: true
  end
end
