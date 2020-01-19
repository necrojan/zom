require 'zomato'

describe "Mato" do 
  
  describe "#initialize" do 
    it "should set the api key" do
      expect(Zom::Mato).to receive(:new).with('secret')
      Zom::Mato.new('secret')
    end

    it "should return an instance of client" do
      client = Zom::Mato.new('secret').instance_variable_get(:@client)
      expect(Zom::Mato).to receive(:new).with('secret').and_return(client)
      Zom::Mato.new('secret')
    end
  end

  describe "#key" do 
    it "should return the api key" do
      zom = Zom::Mato.new('secret')
      expect(zom.key).to eq('secret')
    end
  end

  describe "#get" do 
    it "should receive a url parameter" do 
      zom = Zom::Mato.new('secret')
      expect(zom). to receive(:get).with('/url')
      zom.get('/url')
    end
  end
end