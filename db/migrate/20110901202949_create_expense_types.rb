class CreateExpenseTypes < ActiveRecord::Migration
  def self.up
    create_table :expense_types do |t|
      t.string :name
      t.integer :expense_tax_type_id

      t.timestamps
    end
    add_index :expense_types,:name, :unique => true
  end

  def self.down
    drop_table :expense_types
  end
end
