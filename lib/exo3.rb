require 'rubygems'
require 'nokogiri'
require 'open-uri'

def depute_prenom 
page = Nokogiri::HTML(open("https://www.nosdeputes.fr/deputes"))
separate = []
page.xpath("//*[@class='list_nom']").text

separate.each do |lol|
    puts lol
end


