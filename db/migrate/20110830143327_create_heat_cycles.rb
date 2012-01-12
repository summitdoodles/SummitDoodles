class CreateHeatCycles < ActiveRecord::Migration
  def self.up
    create_table :heat_cycles do |t|
      t.date :date
      t.integer :dame_id
      t.string :in_heat

      t.timestamps
    end
    add_index :heat_cycles, :date
  end

  def self.down
    drop_table :heat_cycles
  end
end
