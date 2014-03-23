class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :name
      t.string :id_num
      t.string :login_pass
      t.string :pay_pass

      t.timestamps
    end
  end
end
