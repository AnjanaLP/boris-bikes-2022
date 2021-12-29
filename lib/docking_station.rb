class DockingStation
  attr_reader :bike

  def release_bike
    raise "Cannot release bike: no bikes available" unless bike
    bike
  end

  def dock(bike)
    @bike = bike
  end
end
