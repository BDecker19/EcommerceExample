class CreateInvoices < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
      t.decimal :final_amount
      t.integer :order_id
      t.timestamps
    end
  end

  def self.down
    drop_table :invoices
  end
end
