class CreateRelations < ActiveRecord::Migration
  def self.up
    create_table :relations do |t|
      t.string :relation

      t.timestamps
    end

    add_index :relations, :relation, :unique => true
  end

  def self.down
    drop_table :relations
  end
end
