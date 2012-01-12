class CreateEmailPriorities < ActiveRecord::Migration
  def self.up
    create_table :email_priorities do |t|
      t.string :name

      t.timestamps
    end
    add_index :email_priorities, :name, :unique => true
  end

  def self.down
    drop_table :email_priorities
  end
end
