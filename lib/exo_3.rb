require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_rep_emails
	rep_emails = []
	page = Nokogiri::XML(open("https://www.nosdeputes.fr/deputes/enmandat/xml"))
	page.xpath("//deputes/depute/emails/email[1]").each do |email|
		rep_emails << email.text
	end
	return rep_emails
end

def depute_prenom
	depute_names = []
	page = Nokogiri::XML(open("https://www.nosdeputes.fr/deputes/enmandat/xml"))
	page.xpath("//deputes/depute/prenom").each do |first_name|
		depute_names << first_name.text
	end
	return depute_names
end

def depute_name
	rep_names = []
	page = Nokogiri::XML(open("https://www.nosdeputes.fr/deputes/enmandat/xml"))
	page.xpath("//deputes/depute/nom_de_famille").each do |last_name|
		rep_names << last_name.text
	end
	return rep_names
end


def hashes_transformation(depute_names, rep_names, rep_emails)
	array_names_email = depute_names.zip(rep_names, rep_emails)
	hash_rep = []
	array_names_email.each {|rep| hash_rep << {"Prénom" => rep[0], "Nom de famille" => rep[1], "email" => rep[2]}} 
 return hash_rep
end

def perform
	depute_names = depute_prenom
	rep_names = depute_name
	rep_emails = get_rep_emails
	puts hashes_transformation(depute_names, rep_names, rep_emails).inspect
end

perform