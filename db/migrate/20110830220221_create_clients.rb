class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :address_1
      t.string :address_2
      t.string :city
      t.integer :state_id
      t.string :zip
      t.string :email
      t.string :phone_number
      t.string :secondary_phone_number
      t.integer :gender_id
      t.boolean :will_be_referal, :default => false
      t.text :reference
      t.text :notes
      t.integer :email_priority_id
      t.boolean :do_not_email, :default => false

      t.timestamps
    end
    
    add_index :clients, :last_name, :unique => true
    add_index :clients, :email_priority_id
    add_index :clients, :do_not_email
    
  end

  def self.down
    drop_table :clients
  end
end
