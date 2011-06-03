class StockPricesController < ApplicationController

  def index
    @stock = StockPrice.new("AAPL")
  end
end
