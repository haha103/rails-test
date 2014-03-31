class CreateSessionStatuses < ActiveRecord::Migration
  def change
    create_table :session_statuses do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
