class CreateColors < ActiveRecord::Migration
  def self.up
    create_table :colors do |t|
      t.string :color

      t.timestamps
    end

    add_index :colors, :color, :unique => true
  end

  def self.down
    drop_table :colors
  end
end
