require 'net/http'
require 'uri'

class StockPrice 

  attr_accessor :ticker

  def initialize (ticker)
    @ticker = ticker
  end

  def stock_price_url 
    "http://finance.google.com/finance/info?client=ig&q=NASDAQ%3a#{self.ticker}"
  end

  def get_stock_price

    # Uncomment these three lines and remove the other lines from this method and getting the stock price should work.
    response = HTTParty.get(stock_price_url)
    stock_hash = parse_gfinance_response(response)
    stock_hash["l"].to_f


  end
  
  def parse_gfinance_response(response_body)
    clean = response_body.gsub(/\s+/, ' ').gsub(/^\s*\/\/\s*\[\s*/, '').gsub(/\s*\]\s*$/, '')
    ActiveSupport::JSON.decode(clean)
  end





end
