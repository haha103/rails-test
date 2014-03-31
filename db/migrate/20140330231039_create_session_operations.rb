class CreateSessionOperations < ActiveRecord::Migration
  def change
    create_table :session_operations do |t|
      t.string :name
      t.string :name_en

      t.timestamps
    end
  end
end
