class Bike

  def working?
    !@broken
  end

  def report_broken(docking_station)
    docking_station.dock(self)
    @broken = true
  end

  def fix
    @broken = false
  end
end
