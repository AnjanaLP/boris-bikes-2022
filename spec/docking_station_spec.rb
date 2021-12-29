require 'docking_station'

describe DockingStation do
  subject(:station)   { described_class.new }
  let(:bike)          { double :bike }

  describe '#release_bike' do
    it 'releases a docked bike' do
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
    it 'docks a bike' do
      expect(station.dock(bike)).to eq bike
    end

    context 'when full' do
      it 'raises an error' do
        station.dock(bike)
        message = "Cannot dock bike: station is full"
        expect { station.dock(bike) }.to raise_error message
      end
    end
  end

  describe '#bike' do
    it 'returns a docked bike' do
      station.dock(bike)
      expect(station.bike).to eq bike
    end
  end
end
