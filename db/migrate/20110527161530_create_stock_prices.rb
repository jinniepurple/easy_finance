class CreateStockPrices < ActiveRecord::Migration
  def self.up
    create_table :stock_prices do |t|
      t.timestamps
    end
  end

  def self.down
    drop_table :stock_prices
  end
end
