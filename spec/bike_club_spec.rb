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

    it "can add bikers" do 
      club = BikeClub.new("Bridge 4")
      biker = Biker.new("Kenny", 30)
      biker2 = Biker.new("Lilly", 15)
      club.add_biker(biker)
      club.add_biker(biker2)
      expect(club.bikers.count).to eq(2)
      expect(club.bikers).to include(biker, biker2)
    end 

    it "can tell which biker has logged the most rides" do 
      club = BikeClub.new("Bridge 4")
      biker = Biker.new("Kenny", 30)
      biker2 = Biker.new("Lilly", 15)
      ride = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      club.add_biker(biker)
      club.add_biker(biker2)
      biker.learn_terrain!(:hills)
      biker2.learn_terrain!(:hills)
      biker.log_ride(ride, 92.5)
      biker.log_ride(ride, 91.1)
      biker2.log_ride(ride, 60.9)
      expect(club.most_rides).to eq("Kenny")
    end 

    it "can tell which biker has the best time for a ride" do 
      club = BikeClub.new("Bridge 4")
      biker = Biker.new("Kenny", 30)
      biker2 = Biker.new("Lilly", 15)
      ride = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      club.add_biker(biker)
      club.add_biker(biker2)
      biker.learn_terrain!(:hills)
      biker2.learn_terrain!(:hills)
      biker.log_ride(ride, 92.5)
      biker.log_ride(ride, 91.1)
      biker2.log_ride(ride, 60.9)

      expect(club.fastest(ride)).to eq ("Lilly")

    end 

    xit "can return which bikers are eligible for a given ride" do 

    end 

  end 

end 