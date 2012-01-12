class CreateGenders < ActiveRecord::Migration
  def self.up
    create_table :genders do |t|
      t.string :gender

      t.timestamps
    end
    
    add_index :genders, :gender, :unique => true
    
  end

  def self.down
    drop_table :genders
  end
end
