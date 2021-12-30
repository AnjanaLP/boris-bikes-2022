require_relative 'bike'
require_relative 'bike_container'
require_relative 'van'
require_relative 'garage'

class DockingStation
  include BikeContainer

  def release_bike
    raise "Cannot release bike: no bikes available" if no_working_bikes?
    release_working_bike
  end

  def dock(bike)
    add_bike(bike)
  end

  def release_broken_bike(bike)
    bikes.delete(bike)
  end

  private

  def working_bikes
    bikes.select { |bike| bike.working? }
  end

  def no_working_bikes?
    working_bikes.empty?
  end

  def release_working_bike
    bikes.delete(working_bikes.pop)
  end
end
