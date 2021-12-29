require 'bike'

describe Bike do
  subject(:bike)    { described_class.new }

  describe '#working?' do
    it 'initially returns true' do
      expect(bike).to be_working
    end

    context 'when reported as broken' do
      it 'returns false' do
        bike.report_broken
        expect(bike).not_to be_working
      end
    end
  end
end
