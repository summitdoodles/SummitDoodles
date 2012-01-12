class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.date :date
      t.decimal :amount, :precision => 8, :scale => 2
      t.integer :client_id
      t.text :notes

      t.timestamps
    end
    add_index :payments,:client_id
    add_index :payments,:date
  end

  def self.down
    drop_table :payments
  end
end
