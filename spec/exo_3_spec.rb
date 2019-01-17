require_relative '../lib/exo_3'


describe "the depute_prenom method" do
	it "contain Sabine" do
		expect(depute_prenom.include? "Florian").to eq(true)
	end
end

describe "the depute_name method" do
	it "countain Abba" do
		expect(depute_name.include? "Bachelier").to eq(true)
	end
end
