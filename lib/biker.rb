class Biker 

  attr_reader :name, :max_distance, :rides, :acceptable_terrain

  def initialize(name, max_distance)

    @name = name 
    @max_distance = max_distance
    @rides = {}
    @acceptable_terrain = []
  end 

  def learn_terrain!(terrain)
    @acceptable_terrain << terrain
  end 

  def log_ride(ride, time)
    return "#{name} doesn't know this terrain yet!" unless @acceptable_terrain.include?(ride.terrain)

    ride_distance = ride.total_distance
    return "#{name} cannot ride that far!" if ride_distance > @max_distance
  
    @rides[ride] ||= []
    @rides[ride] << time 
  end

end 