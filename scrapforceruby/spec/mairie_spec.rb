require_relative '../lib/mairie'

describe "the get_townhall_urls method" do
    it "should return an array not nil with at least one hash inside with a value " do
      expect(get_townhall_urls(Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html")))).not_to be_nil
    end
#    it "should contains this value " do
#      expect(get_townhall_urls(Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html")))).to eq("BTC")
#    end
  end