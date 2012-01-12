class CreateSupportClients < ActiveRecord::Migration
  def self.up
    create_table :support_clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.integer :relation_id
      t.integer :client_id

      t.timestamps
    end
    add_index :support_clients, :client_id
    add_index :support_clients, :last_name
  end

  def self.down
    drop_table :support_clients
  end
end
