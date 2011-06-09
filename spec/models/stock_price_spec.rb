require "spec_helper"
describe StockPrice do
  describe "#get_stock_price" do
    it "returns the price of the stock" do
      stock = StockPrice.new("AAPL")
      stock.get_stock_price.should == 24.76
    end
  end
  
  describe "#parse_gfinance_response" do
    it "should clean the response body from google finance properly" do
      stock = StockPrice.new("AAPL")
      stock.parse_gfinance_response(gfinance_response).should == {"id"=>"22144", "t"=>"AAPL", "e"=>"NASDAQ", "l"=>"332.24", "l_cur"=>"332.24", "s"=>"2", "ltt"=>"4:00PM EDT", "lt"=>"Jun 8, 4:00PM EDT", "c"=>"+0.20", "cp"=>"0.06", "ccol"=>"chg", "el"=>"332.22", "el_cur"=>"332.22", "elt"=>"Jun 8, 7:59PM EDT", "ec"=>"-0.02", "ecp"=>"-0.01", "eccol"=>"chr", "div"=>"", "yld"=>""}
    end
  end
end

def gfinance_response
  <<EOF 
 
 // [
{
"id": "22144"
,"t" : "AAPL"
,"e" : "NASDAQ"
,"l" : "332.24"
,"l_cur" : "332.24"
,"s": "2"
,"ltt":"4:00PM EDT"
,"lt" : "Jun 8, 4:00PM EDT"
,"c" : "+0.20"
,"cp" : "0.06"
,"ccol" : "chg"
,"el": "332.22"
,"el_cur": "332.22"
,"elt" : "Jun 8, 7:59PM EDT"
,"ec" : "-0.02"
,"ecp" : "-0.01"
,"eccol" : "chr"
,"div" : ""
,"yld" : ""
}
] 
EOF
end