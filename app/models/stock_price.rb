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
    # response = HTTParty.get('http://finance.google.com/finance/info?client=ig&q=NASDAQ%3aAAPL')
    # stock_hash = parse_gfinance_response(response)
    # stock_hash["l"].to_f
    
    # Remove these lines
    body = '[ { "id": "358464" ,"t" : "MSFT" ,"e" : "NASDAQ" ,"l" : "24.76" ,"l_cur" : "24.76" ,"s": "0" ,"ltt":"11:29AM EDT" ,"lt" : "May 27, 11:29AM EDT" ,"c" : "+0.09" ,"cp" : "0.35" ,"ccol" : "chg" } ]'
    #body = res.body.gsub(/^\/\//, "")
    ActiveSupport::JSON.decode(body).first["l"].to_f

  end
  
  def parse_gfinance_response(response_body)
    clean = response_body.gsub(/\s+/, ' ').gsub(/^\s*\/\/\s*\[\s*/, '').gsub(/\s*\]\s*$/, '')
    ActiveSupport::JSON.decode(clean)
  end





end
