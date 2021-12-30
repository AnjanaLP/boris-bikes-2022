shared_examples_for BikeContainer do
  let(:bike)    { double :bike }

  describe '#capacity' do
    context 'when no capacity given on initialize' do
      it 'returns the default capacity' do
        expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
      end
    end

    context 'when capacity given on initialize' do
      subject   { described_class.new(50) }
      it 'returns the specified capacity' do
        expect(subject.capacity).to eq 50
      end
    end
  end

  describe '#add_bike' do
    it "adds the bike to it's collection" do
      subject.add_bike(bike)
      expect(subject).not_to be_empty
    end

    context 'when at capacity' do
      it 'raises an error' do
        subject.capacity.times do
          subject.add_bike(bike)
        end
        message = "Cannot add bike: #{described_class.name} full"
        expect{ subject.add_bike(bike) }.to raise_error message
      end
    end
  end

  describe '#remove_bike' do
    before do
      subject.add_bike(bike)
    end

    it 'returns the removed bike' do
      expect(subject.remove_bike).to eq bike
    end

    it "removes the bike from it's collection" do
      subject.remove_bike
      expect(subject).to be_empty
    end

    context 'when empty' do
      it 'raises an error' do
        subject.remove_bike
        message = "Cannot remove bike: #{described_class.name.split("_").join(" ")} empty"
        expect{ subject.remove_bike}.to raise_error message
      end
    end
  end
end
