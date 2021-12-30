require 'docking_station'
require 'support/shared_examples_for_bike_container'

describe DockingStation do
  subject(:station)   { described_class.new }
  let(:bike)          { double :bike, report_broken: nil }

  describe '#release_bike' do
    context 'when no working bikes' do
      it 'raises an error' do
        allow(bike).to receive(:working?).and_return false
        report_broken_at_station
        message = "Cannot release bike: no bikes available"
        expect{ station.release_bike }.to raise_error message
      end
    end
  end

  describe '#dock' do
    context 'when bike is reported broken' do
      it 'still accepts the bike' do
        report_broken_at_station
        expect(station).not_to be_empty
      end
    end
  end

  describe '#release_broken_bike' do
    it 'is removed from the bikes collection' do
      station.release_broken_bike(bike)
      expect(station).to be_empty
    end
  end
end
