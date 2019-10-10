require 'rubygems'
require 'nokogiri'   
require 'open-uri'

PAGE_URL = "https://www.annuaire-des-mairies.com/val-d-oise.html"

def get_townhall_urls(url)
  b = []
  news_links = url.css("a.lientxt")
  news_links.each do |link|
    b << link['href']
  end
  b.map! do |partial_adress|
    partial_adress = partial_adress[2..-1]
    partial_adress = "https://www.annuaire-des-mairies.com/#{partial_adress}"
  end
  return b
end

def get_townhall_names(url)
  b = []
  news_links = url.css("a.lientxt")
  news_links.each do |link|
    b << link.text
  end
  return b
end

def get_townhall_email(array_of_adresses)
  a = []
  array_of_adresses.each do |adresses|
    Nokogiri::HTML(open(adresses)).xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |node|
      a << node.text
    end
  end
  return a
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
  array_townhall_urls = get_townhall_urls(page)
  array_city = get_townhall_names(page)
  array_emails = get_townhall_email(array_townhall_urls)
  array_of_hash = join_my_two_arrays(array_city, array_emails)
  print array_of_hash
end

perform