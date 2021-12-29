describe 'User Stories' do

  # As a person,
  # So that I can use a bike,
  # I'd like a docking station to release a bike
  it 'a docking station can release a bike' do
    station = DockingStation.new
    expect{ station.release_bike }.not_to raise_error
  end

  # As a person,
  # So that I can use a good bike,
  # I'd like to see if a bike is working
  it 'a person can see if a bike is working' do
    bike = Bike.new
    expect { bike.working? }.not_to raise_error
  end
end
