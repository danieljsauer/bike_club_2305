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
  # I am now realizing, I should create a new ride when I add a leg, since we will be comparing times over different distances. I will fix this later if I have time.

  def personal_best(ride)
    times = @rides[ride]
    if times.nil? 
      return "#{name} has not ridden that ride yet!"
    else 
      times.min
    end 
  end 
end 