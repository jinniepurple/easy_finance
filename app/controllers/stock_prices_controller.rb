class StockPricesController < ApplicationController

  def index
    @stock = StockPrice.new("aapl")
  end

  def create
    @stock = StockPrice.new(params[:stock][:ticker])
    render "new"
  end
  def new

  end
end
