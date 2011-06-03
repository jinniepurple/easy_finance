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
    #url = URI.parse(self.stock_price_url)
    #res = Net::HTTP.start(url.host, url.port) {|http|
      #http.get(url.path)
    #}
    body = '[ { "id": "358464" ,"t" : "MSFT" ,"e" : "NASDAQ" ,"l" : "24.76" ,"l_cur" : "24.76" ,"s": "0" ,"ltt":"11:29AM EDT" ,"lt" : "May 27, 11:29AM EDT" ,"c" : "+0.09" ,"cp" : "0.35" ,"ccol" : "chg" } ]'
    #body = res.body.gsub(/^\/\//, "")
    ActiveSupport::JSON.decode(body)

    
  end



end
