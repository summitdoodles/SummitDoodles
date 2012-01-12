class CreateChargeTypes < ActiveRecord::Migration
  def self.up
    create_table :charge_types do |t|
      t.string :name

      t.timestamps
    end
    add_index :charge_types,:name, :unique => true
  end

  def self.down
    drop_table :charge_types
  end
end
