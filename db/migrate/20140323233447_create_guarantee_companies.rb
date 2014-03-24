class CreateGuaranteeCompanies < ActiveRecord::Migration
  def change
    create_table :guarantee_companies do |t|
      t.string :name

      t.timestamps
    end
  end
end
