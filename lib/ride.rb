class Ride 

  attr_reader :name, :distance, :loop, :terrain

  def initialize(ride_details)

    @name = ride_details[:name]
    @distance = ride_details[:distance]
    @loop = ride_details[:loop]
    @terrain = ride_details[:terrain]
    @counter = 1
  end 

  def loop?
    @loop
  end 

  def add_leg

    !@loop 
    @counter += 1

  end 

def total_distance
  if loop? == false
    (@distance * @counter).round(1)
  else 
    @distance
  end 
end


end 
