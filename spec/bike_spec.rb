require 'bike'

describe Bike do
  subject(:bike)          { described_class.new }
  let(:docking_station)   { double :docking_station }

  describe '#working?' do
    it 'initially returns true' do
      expect(bike).to be_working
    end

    context 'when reported as broken' do
      it 'returns false' do
        allow(docking_station).to receive(:dock).with(bike)
        bike.report_broken(docking_station)
        expect(bike).not_to be_working
      end
    end
  end

  describe '#report_broken' do
    it 'docks the bike' do
      expect(docking_station).to receive(:dock).with(bike)
      bike.report_broken(docking_station)
    end
  end

  describe '#fix' do
    it 'makes the bike work again' do
      bike.fix
      expect(bike).to be_working
    end
  end
end
