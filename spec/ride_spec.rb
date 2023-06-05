require './lib/ride'

describe Ride do
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