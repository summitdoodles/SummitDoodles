class CreateExpenses < ActiveRecord::Migration
  def self.up
    create_table :expenses do |t|
      t.integer :expense_type_id
      t.string :name
      t.decimal :amount, :precision => 8, :scale => 2
      t.date :date
      t.integer :litter_id
      t.text :notes

      t.timestamps
    end
    add_index :expenses,:litter_id
    
  end

  def self.down
    drop_table :expenses
  end
end
