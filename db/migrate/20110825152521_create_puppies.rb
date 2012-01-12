class CreatePuppies < ActiveRecord::Migration
  def self.up
    create_table :puppies do |t|
      t.string :name
      t.integer :gender_id
      t.integer :color_id
      t.date :date_sold
      t.integer :litter_id
      t.string :collar_color_name
      t.integer :client_id
      t.text :notes

      t.timestamps
    end

   add_index :puppies, :name
  end

  def self.down
    drop_table :puppies
  end
end
