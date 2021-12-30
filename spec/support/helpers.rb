module Helpers
  def report_broken_at_station
    station.dock(bike)
    bike.report_broken(station)
  end
end
