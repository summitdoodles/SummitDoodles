class CreateExpenseTaxTypes < ActiveRecord::Migration
  def self.up
    create_table :expense_tax_types do |t|
      t.string :name

      t.timestamps
    end
    add_index :expense_tax_types,:name, :unique => true
  end

  def self.down
    drop_table :expense_tax_types
  end
end
