class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :commodity_id
      t.integer :package_id
      t.integer :num
      t.float :price
      
      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
