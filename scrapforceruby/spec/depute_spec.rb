require_relative '../lib/depute'

describe "the get_all_datas method" do
  it "should return an array not nil with at least one hash inside with a value " do
    expect(get_all_datas(Nokogiri::HTML(open("https://wiki.laquadrature.net/Contactez_vos_d%C3%A9put%C3%A9s")))).not_to be_nil
  end
  
# it "should contains this value " do
#   expect(get_all_datas(Nokogiri::HTML(open("https://wiki.laquadrature.net/Contactez_vos_d%C3%A9put%C3%A9s")))).not_to be_nil
# end
end