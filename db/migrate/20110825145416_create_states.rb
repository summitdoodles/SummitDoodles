class CreateStates < ActiveRecord::Migration
  def self.up
    create_table :states do |t|
      t.string :name
      t.string :short_name

      t.timestamps
    end

    add_index :states,:short_name, :unique => true
    add_index :states,:name, :unique => true

  end

  def self.down
    drop_table :states
  end
end
