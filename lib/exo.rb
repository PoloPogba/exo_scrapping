require 'rubygems'
require 'nokogiri'
require 'open-uri'

     

def price 
    
    prix = [] 
    @array=[]
    monnaie = []
    #methode pour scraper le prix
    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))     #lien du site
    doc_cours = page.xpath('//td[@class="no-wrap text-right"]/a[@class="price"]')   #xpath jusqu'au prix
    cours = doc_cours.each do |crs|                                                 # boucle pour chaque prix, l'afficher et le mettre ds un array en enlevant le "$"
    prix << crs.text[1..-1].to_f                                                   # la mettre en float
    end
    


    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    doc_crypto = page.xpath('//td[@class="text-left col-symbol"]')
    crypto = doc_crypto.each do |cry|                                       # pour chaque monnaie, la met ds un array 
    monnaie << cry.text 
    
    for n in 0...monnaie.length                                            # boucle allant de 0 aux nombre de monnaie qui rentre chaque valeur des arrays dans un hash
        hash={monnaie[n] => prix[n]}                                      
        @array << hash                                                      # mettre les hashes ds un array
    end
end

    
end

price

puts @array