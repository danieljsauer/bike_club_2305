require './lib/ride'
require './lib/biker'
require './lib/bike_club'
require 'pry'

describe BikeClub do
  describe "initialize" do 
    it "exists" do 
      club = BikeClub.new("Bridge 4")
      expect(club).to be_instance_of(BikeClub)
    end 

    it "has a name" do 
      club = BikeClub.new("Bridge 4")
      expect(club.name).to eq("Bridge 4")
    end 

    it "can hold a list of bikers" do 
      club = BikeClub.new("Bridge 4")
      expect(club.bikers).to eq ([])
    end 
  end 

  describe "instance methods" do 

    xit "can add bikers" do 
      club = BikeClub.new("Bridge 4")
      biker = Biker.new("Kenny", 30)
      biker2 = Biker.new("Lilly", 15)
      club.add_biker(biker)
      club.add_biker(biker2)
      expect(club.bikers.count).to eq(2)
      expect(club.bikers).to include(biker, biker2)
    end 

  end 

end 