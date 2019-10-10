require 'rubygems'
require 'nokogiri'   
require 'open-uri'

PAGE_URL = "https://coinmarketcap.com/all/views/all/"


def take_symbol(url)
  a = []
  url.xpath('//*[@class="text-left col-symbol"]').each do |node| 
		a << node.text
  end
  return a
end

def take_value(url)
  b = []
	url.xpath('//*[@class="price"]').each do |node| 
    b << node.text
  end
  b.map! do |text|
    text = text[1..-1]
  end
  return b
end

def join_my_two_arrays(array_1, array_2)
  array_final = []
  array_2.size.times do |i|
  array_final << {array_1[i] => array_2[i]}
  end
  return array_final
end

def perform
  page = Nokogiri::HTML(open(PAGE_URL))
  array_symbol = take_symbol(page)
  array_value = take_value(page)
  array_of_hash = join_my_two_arrays(array_symbol, array_value)
  print array_of_hash
end

perform