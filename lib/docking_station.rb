class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    raise "Cannot release bike: no bikes available" if empty?
    remove_bike
  end

  def dock(bike)
    raise "Cannot dock bike: station is full" if full?
    add_bike(bike)
  end

  private
  
  attr_reader :bikes

  def empty?
    bikes.empty?
  end

  def full?
    bikes.count >= capacity
  end

  def remove_bike
    bikes.pop
  end

  def add_bike(bike)
    bikes << bike
  end
end
