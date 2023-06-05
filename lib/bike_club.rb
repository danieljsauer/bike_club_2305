class BikeClub

  attr_reader :name, :bikers

  def initialize(name)
    @name = name
    @bikers = []
  end 

  def add_biker(biker)
    @bikers << biker 
  end 

  def most_rides
    return "No bikers in club :(" if @bikers.empty?
  
    most_rides_biker = ""
    max_rides = 0
  
    @bikers.each do |biker|
      ride_count = biker.rides.count
      if ride_count > max_rides
        max_rides = ride_count
        most_rides_biker = biker
      end
    end
  
    most_rides_biker.name 
  end

  def fastest(ride)
    return "No bikers in club :(" if @bikers.empty?

    fastest_biker = ""
    fastest_time = Float::INFINITY
    #This is neat ^ 

    @bikers.each do |biker|
      time = biker.personal_best(ride)
        if time < fastest_time
          fastest_time = time 
          fastest_biker = biker
        end 
      end 
      fastest_biker.name
  end 

  def capable(ride)
    eligible_bikers = []
    eligible_bikers = @bikers.find do |biker|
      biker.acceptable_terrain.include?(ride.terrain) &&
        biker.max_distance >= ride.total_distance
    end
    eligible_bikers.name
    #I was here when time ran out. First test is passing, but it currently doesn't work with multiple bikers. Will need to .join the names next I think.
  end 


end 
