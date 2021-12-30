require_relative 'bike_container'

class Van
  include BikeContainer

  def load(bike, docking_station)
    raise "Do not load bike: bike is not broken" if working_bike?(bike)
    add_bike(bike)
    docking_station.release_broken_bike(bike)
  end

  def unload(garage)
    garage.accept(remove_bike)
  end

  private

  def working_bike?(bike)
    bike.working?
  end
end
