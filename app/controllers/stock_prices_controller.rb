class StockPricesController < ApplicationController

  def index
    @stock = StockPrice.new
  end

  def create
    @stock = StockPrice.new(params[:stock])
    render "new"
  end
  def new

  end
end
