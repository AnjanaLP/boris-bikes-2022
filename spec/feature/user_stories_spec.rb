describe 'User Stories' do

  # As a person,
  # So that I can use a bike,
  # I'd like a docking station to release a bike
  it 'a docking station can release a bike' do
    station = DockingStation.new
    expect{ station.release_bike }.not_to raise_error
  end
end
