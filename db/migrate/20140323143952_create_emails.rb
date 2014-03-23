class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :addr
      t.boolean :primary
      t.references :user, index: true

      t.timestamps
    end
  end
end
