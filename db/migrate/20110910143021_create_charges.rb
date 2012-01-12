class CreateCharges < ActiveRecord::Migration
  def self.up
    create_table :charges do |t|
      t.date :date
      t.decimal :amount, :precision => 8, :scale => 2
      t.integer :charge_type_id
      t.integer :puppy_id
      t.integer :client_id
      t.text :notes

      t.timestamps
    end
    add_index :charges,:puppy_id
    add_index :charges,:client_id
    add_index :charges,:date
  end

  def self.down
    drop_table :charges
  end
end
