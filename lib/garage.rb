require_relative 'bike_container'

class Garage
  include BikeContainer

  def accept(bike)
    add_bike(bike)
  end

  def fix_bike(bike)
    bike.fix
  end
end
