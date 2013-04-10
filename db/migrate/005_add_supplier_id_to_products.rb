class AddSupplierIdToProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.integer :supplier_id
    end
  end

  def self.down
    change_table :products do |t|
      t.remove :supplier_id
    end
  end
end
