class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bikes, :capacity

  def initialize
    @bikes = []
    @capacity = DEFAULT_CAPACITY
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

  def empty?
    bikes.empty?
  end

  def full?
    bikes.count >= DEFAULT_CAPACITY
  end

  def remove_bike
    bikes.pop
  end

  def add_bike(bike)
    bikes << bike
  end
end
