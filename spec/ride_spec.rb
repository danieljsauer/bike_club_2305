require './lib/ride'

describe Ride do
  describe "initialize" do 
    it "exists" do
      ride = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      expect(ride).to be_instance_of(Ride)
    end 

    it "has name, distance, loop, and terrain instance variables" do 
      ride = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      expect(ride.name).to eq("Walnut Creek Trail")
      expect(ride.distance).to eq(10.7)
      expect(ride.loop).to be false 
      expect(ride.terrain).to eq(:hills)
    end 
  end 

  describe "instance methods" do 
    it "can check if ride is a loop or not" do 
      ride = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      expect(ride.loop?).to be false 
    end 

    it " can add distance of non loop rides" do 
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
      expect(ride1.loop?).to be false 
      expect(ride2.loop?).to be true 
      ride1.loop?
      ride2.loop?
      expect(ride1.total_distance).to eq(21.4)
      expect(ride2.total_distance).to eq(14.9)
    end 
  end 
end 