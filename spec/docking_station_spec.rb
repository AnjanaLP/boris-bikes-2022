require 'docking_station'

describe DockingStation do
  subject(:station)   { described_class.new }
  let(:bike)          { double :bike }

  describe '#release_bike' do
    it 'removes a bike from the bikes collection' do
      station.dock(bike)
      expect(station.release_bike).to eq bike
    end

    context 'when empty' do
      it 'raises an error' do
        message = "Cannot release bike: no bikes available"
        expect { station.release_bike }.to raise_error message
      end
    end
  end

  describe '#dock' do
    it 'adds the bike to the bikes collection' do
      station.dock(bike)
      expect(station.bikes).to include bike
    end

    context 'when full' do
      it 'raises an error' do
        station.capacity.times { station.dock(bike) }
        message = "Cannot dock bike: station is full"
        expect { station.dock(bike) }.to raise_error message
      end
    end
  end

  describe '#bikes' do
    it 'is initially empty' do
      expect(station.bikes).to be_empty
    end

    it 'returns all the docked bikes' do
      station.dock(bike)
      expect(station.bikes).to eq [bike]
    end
  end

  describe '#capacity' do
    it 'has a default capacity' do
      expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
  end
end
