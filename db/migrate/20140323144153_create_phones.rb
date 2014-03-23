class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :number
      t.boolean :mobile
      t.references :user, index: true

      t.timestamps
    end
  end
end
