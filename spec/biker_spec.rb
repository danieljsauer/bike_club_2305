require './lib/ride'
require './lib/biker'

describe Biker do
  describe "initialize" do 
    it "exists" do 
      biker = Biker.new("Kenny", 30)
      expect(biker).to be_instance_of(Biker) 
    end 

    it "has name, max_stiance, rides, and acceptable_terrain instance variables" do 
      biker = Biker.new("Kenny", 30)
      expect(biker.name).to eq("Kenny")
      expect(biker.max_distance).to eq(30)
      expect(biker.rides).to eq({})
      expect(biker.acceptable_terrain).to eq([])
    end 
  end 
end 