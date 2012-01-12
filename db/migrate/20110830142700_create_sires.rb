class CreateSires < ActiveRecord::Migration
  def self.up
    create_table :sires do |t|
      t.string :name
      t.date :birthday
      t.boolean :active, :default => false 
      t.integer :breed_id

      t.timestamps
    end
  end

  def self.down
    drop_table :sires
  end
end
