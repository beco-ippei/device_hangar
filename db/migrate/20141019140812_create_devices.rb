class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.integer :number
      t.string :classify
      t.string :name
      t.string :carrier
      t.boolean :sim
      t.string :os
      t.string :version
      t.string :telephone_number
      t.string :passcode
      t.string :emails        #TODO: templary
      t.integer :user_id
      t.timestamp :lock_at

      t.timestamps
    end
  end
end
