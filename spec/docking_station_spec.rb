require 'docking_station'

describe DockingStation do
  subject(:station)   { described_class.new }
  let(:bike)          { double :bike }

  describe '#release_bike' do
    it { is_expected.to respond_to :release_bike }
  end

  describe '#dock' do
    it 'docks a bike' do
      expect(station.dock(bike)).to eq bike
    end
  end

  describe '#bike' do
    it 'returns a docked bike' do
      station.dock(bike)
      expect(station.bike).to eq bike
    end
  end
end
