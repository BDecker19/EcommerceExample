class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :title
      t.decimal :price
      t.string :image_url
      t.integer :stock_level
      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
