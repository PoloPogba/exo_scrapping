require 'rubygems'
require 'nokogiri'
require 'open-uri'
def get_townhall_email(townhall_url)
    page_1 = Nokogiri::HTML(open(townhall_url))
    url_page= page_1.xpath('//tbody/tr[4]/td[2]')
    #puts url_page[0].text
    
end
#puts get_townhall_email("http://annuaire-des-mairies.com/95/ableiges.html")
def get_townhall_urls
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    title_indiv=[]
    get = []
    array=[]
    lol = "http://annuaire-des-mairies.com"
 
    title = page.xpath('//p/a').each do |tit|
    title_indiv << tit.text
    #puts title_indiv
    end
    
    page.xpath("//p/a/@href").each do |url|
        urlol = "#{url}"[1..-1]
        urls= "#{lol}"+"#{urlol}"
    get1 = get_townhall_email(urls)
    get2=get1[0].text
     get << get2
     
    end
    
for n in 0...title_indiv.length
    hash={title_indiv[n] => get[n]}
    array << hash
end
      return array
    
end

puts get_townhall_urls







begin
    get_townhall_urls

rescue => e

    puts "erreur"
    
end