class CreateLitters < ActiveRecord::Migration
  def self.up
    create_table :litters do |t|
      t.date :birthday
      t.integer :sire_id
      t.integer :dame_id

      t.timestamps
    end
    add_index :litters, :birthday
  end

  def self.down
    drop_table :litters
  end
end
