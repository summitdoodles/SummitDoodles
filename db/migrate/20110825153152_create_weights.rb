class CreateWeights < ActiveRecord::Migration
  def self.up
    create_table :weights do |t|
      t.date :date
      t.integer :lb
      t.integer :oz
      t.integer :puppy_id

      t.timestamps
    end
    add_index :weights, :date
  end

  def self.down
    drop_table :weights
  end
end
