describe 'User Stories' do
  let(:station)   { DockingStation.new }
  let(:bike)      { Bike.new }

  # As a person,
  # So that I can use a bike,
  # I'd like a docking station to release a bike
  it 'a docking station can release a docked bike' do
    station.dock(bike)
    expect(station.release_bike).to eq bike
  end

  # As a person,
  # So that I can use a good bike,
  # I'd like to see if a bike is working
  it 'a person can see if a bike is working' do
    expect { bike.working? }.not_to raise_error
  end

  # As a member of the public
  # So I can return bikes I've hired
  # I want to dock my bike at the docking station
  it 'a docking station can dock a bike' do
    expect { station.dock(bike) }.not_to raise_error
  end

  # As a member of the public
  # So I can decide whether to use the docking station
  # I want to see a bike that has been docked
  it 'a person can see if a docking station has a docked bike' do
    station.dock(bike)
    expect(station.bikes).to include bike
  end

  # As a member of the public,
  # So that I am not confused and charged unnecessarily,
  # I'd like docking stations not to release bikes when there are none available
  it 'empty docking stations cannot release bikes' do
    message = "Cannot release bike: no bikes available"
    expect { station.release_bike }.to raise_error message
  end

  # As a maintainer of the system,
  # So that I can control the distribution of bikes,
  # I'd like docking stations not to accept more bikes than their capacity
  it 'full docking stations cannot dock bikes' do
    station.capacity.times { station.dock(bike) }
    message = "Cannot dock bike: station is full"
    expect { station.dock(bike) }.to raise_error message
  end

  # As a system maintainer,
  # So that I can plan the distribution of bikes,
  # I want a docking station to have a default capacity of 20 bikes
  it 'docking stations have a default capacity' do
    expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end
end
