require './lib/ride'
require './lib/biker'
require 'pry'

describe Biker do
  describe "initialize" do 
    it "exists" do 
      biker = Biker.new("Kenny", 30)
      expect(biker).to be_instance_of(Biker) 
    end 

    it "has name, max_distance, rides, and acceptable_terrain instance variables" do 
      biker = Biker.new("Kenny", 30)
      expect(biker.name).to eq("Kenny")
      expect(biker.max_distance).to eq(30)
      expect(biker.rides).to eq({})
      expect(biker.acceptable_terrain).to eq([])
    end 
  end 

  describe "instance methods" do 
    it "can learn new terrain" do 
      biker = Biker.new("Kenny", 30)
      biker.learn_terrain!(:gravel)
      expect(biker.acceptable_terrain).to include(:gravel)
      biker.learn_terrain!(:hills)
      expect(biker.acceptable_terrain).to include(:gravel, :hills)
    end 

    it "can log rides with ride object and time" do 
      biker = Biker.new("Kenny", 30)
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
      biker.learn_terrain!(:gravel)
      biker.learn_terrain!(:hills)
      biker.log_ride(ride1, 92.5)
      biker.log_ride(ride1, 91.1)
      biker.log_ride(ride2, 60.9)
      biker.log_ride(ride2, 61.6)

      expect(biker.rides).to eq({
        ride1 => [92.5, 91.1],
        ride2 => [60.9, 61.6]
      })
    end 

    it "can only ride on known terrain" do 
      biker = Biker.new("Kenny", 30)
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      expect(biker.log_ride(ride1, 92.5)).to eq("#{biker.name} doesn't know this terrain yet!")
    end 

    it "can only ride within max distance" do 
      biker = Biker.new("Kenny", 30)
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      biker.learn_terrain!(:hills)
      ride1.add_leg
      ride1.add_leg
      expect(biker.log_ride(ride1, 92.5)).to eq("#{biker.name} cannot ride that far!")
      expect(biker.rides).to eq({}) 
      ride1.remove_leg
      biker.log_ride(ride1, 92.5)
      expect(biker.rides).to eq({
        ride1 => [92.5]
      })
    end 

    # I am now realizing, I should create a new ride when I add a leg, since we will be comparing times over different distances. I will fix this later if I have time.

    it "can log PBs" do 
      biker = Biker.new("Kenny", 30)
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
      biker.learn_terrain!(:hills)
      biker.log_ride(ride1, 92.5)
      biker.log_ride(ride1, 91.1)
      expect(biker.personal_best(ride1)).to eq(91.1)
      expect(biker.personal_best(ride2)).to eq("#{biker.name} has not ridden that ride yet!") 
    end 

  end 
end 