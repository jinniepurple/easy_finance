class AddTickerToStockPrices < ActiveRecord::Migration
  def self.up
    add_column :stock_prices, :ticker, :string
  end

  def self.down
    remove_column :stock_prices, :ticker
  end
end
