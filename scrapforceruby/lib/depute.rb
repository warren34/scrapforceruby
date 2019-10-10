require 'rubygems'
require 'nokogiri'   
require 'open-uri'

PAGE_URL = "https://wiki.laquadrature.net/Contactez_vos_d%C3%A9put%C3%A9s"

def get_all_datas(url)
  b = []
  i = 12 
  while i<= 36
    news_links = url.css("#mw-content-text > div > ul:nth-child(#{i}) > li")
    news_links.each do |link|
      b << link.text
    end
  i+=2
  end
  b.map! do |link|
    first_space = link.index(" ")
    first_bracket = link.index("(")
    first_two_points = link.index(":")
    first_semicolon = link.index(";")
    if first_space != nil && first_bracket != nil && first_two_points != nil && first_semicolon != nil
    first_name = link[0...first_space]
    last_name = link[first_space...first_bracket]
    email = link[first_two_points+2...first_semicolon-1]
    link = first_name + last_name + email
    link.split(" ")
    end
  end
  return b
end

def final_array(array_brut)
  
  array_final = []
  array_brut.each do |depute|
    if depute != nil
      depute.size.times do 
        array_final << {
          "first_name" => depute[0],
          "last_name" => depute[1],                                      
          "email" => depute[2]
        }
      end 
    end
  end
  return array_final
end

def perform
  page = Nokogiri::HTML(open(PAGE_URL))
  array_brut = get_all_datas(page)
  array_of_hash = final_array(array_brut)
  print array_of_hash
end

perform