class CreateBreeds < ActiveRecord::Migration
  def self.up
    create_table :breeds do |t|
      t.string :name

      t.timestamps
    end
    
    add_index :breeds, :name, :unique => true
    
  end

  def self.down
    drop_table :breeds
  end
end
