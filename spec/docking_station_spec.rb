require 'docking_station'

describe DockingStation do
  subject(:station)   { described_class.new }
  let(:bike)          { double :bike, working?: true }
  let(:broken_bike)   { double :bike, working?: false }

  describe '#release_bike' do
    it 'removes a working bike from the bikes collection' do
      station.dock(bike)
      expect(station.release_bike).to eq bike
    end

    context 'when empty' do
      it 'raises an error' do
        message = "Cannot release bike: no bikes available"
        expect { station.release_bike }.to raise_error message
      end
    end

    context 'when no working bikes' do
      it 'raises an error' do
        station.dock(broken_bike)
        message = "Cannot release bike: no working bikes available"
        expect{ station.release_bike }.to raise_error message
      end
    end
  end

  describe '#dock' do
    it 'adds the bike to the bikes collection' do
      docked_bikes = station.dock(bike)
      expect(docked_bikes).to include bike
    end

    context 'when full' do
      it 'raises an error' do
        station.capacity.times { station.dock(bike) }
        message = "Cannot dock bike: station is full"
        expect { station.dock(bike) }.to raise_error message
      end
    end
  end

  describe '#capacity' do
    context 'when no capacity given on initialize'do
      it 'returns the default capacity' do
        expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
      end
    end

    context 'when a capacity is given on initialize' do
      subject(:larger_station)    { described_class.new(50) }
      it 'returns the specified capacity' do
        expect(larger_station.capacity).to eq 50
      end
    end
  end
end
