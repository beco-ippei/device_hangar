class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.integer :number
      t.string :name
      t.string :long_name
      t.string :os
      t.string :user
      t.timestamp :lock_at

      t.timestamps
    end
  end
end
