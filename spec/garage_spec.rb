require 'garage'
require 'support/shared_examples_for_bike_container'

describe Garage do
  subject(:garage)    { described_class.new }
  let(:bike)          { double :bike }

  it_behaves_like BikeContainer

  describe '#fix_bike' do
    it 'calls the fix method on the bike' do
      expect(bike).to receive(:fix)
      garage.fix_bike(bike)
    end
  end
end
