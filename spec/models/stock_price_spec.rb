require "spec_helper"
describe StockPrice do
  describe "#get_stock_price" do
    it "returns the price of the stock" do
      stock = StockPrice.new("AAPL")
      stock.get_stock_price.should == 24.76
    end
  end
end