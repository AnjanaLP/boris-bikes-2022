require 'van'
require 'support/shared_examples_for_bike_container'

describe Van do
  it_behaves_like BikeContainer

  subject(:van)         { described_class.new }
  let(:bike)            { double :bike }
  let(:docking_station) { double :docking_station, release_broken_bike: nil }
  let(:garage)          { double :garage }

  describe '#load' do
    context 'when bike is broken' do
      it 'removes the bike from the docking station' do
        allow(bike).to receive(:working?).and_return false
        van.load(bike, docking_station)
        expect(docking_station).to have_received(:release_broken_bike)
      end
    end

    context 'when bike is not broken' do
      it 'raises an error' do
        allow(bike).to receive(:working?).and_return true
        message = "Do not load bike: bike is not broken"
        expect{ van.load(bike, docking_station)}.to raise_error message
      end
    end
  end

  describe '#unload' do
    it "adds the bike to the garage's collection" do
      allow(bike).to receive(:working?).and_return false
      van.load(bike, docking_station)
      expect(garage).to receive(:accept).with(bike)
      van.unload(garage)
    end
  end
end
