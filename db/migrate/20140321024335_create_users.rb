class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :name
      t.boolean :admin
      t.boolean :email_activated
      t.boolean :mobile_activated
      t.boolean :bankaccount_binded
      t.string :id_card
      t.string :addr_country
      t.string :addr_province
      t.string :addr_city
      t.string :addr_details
      t.string :mobile
      t.string :additional_phone

      t.timestamps
    end
  end
end
