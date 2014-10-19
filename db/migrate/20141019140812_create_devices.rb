class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name
      t.string :long_name
      t.string :os

      t.timestamps
    end
  end
end
