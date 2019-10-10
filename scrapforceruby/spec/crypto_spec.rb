require_relative '../lib/crypto'

describe "the scraping method" do
  it "should return an array not nil with at least one hash inside with a value " do
    expect(take_symbol(Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")))).not_to be_nil
  end
# it "should contains this value " do
#  expect(take_symbol(Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")))).to eq("BTC")
# end
end