require 'game_of_life'

describe GameOfLife::Cell do

  let(:board) { mock }
  context 'less than two neighbors' do
    before do
      board.stub(:number_of_living_neighbors).with(0, 0).and_return(1)
    end

    context 'and is alive' do
      subject { described_class.new(true).tick(board).alive? }

      it 'starves' do
        subject.should be_false
      end
    end

    context 'and is dead' do
      subject { described_class.new(false).tick(board).alive? }

      it 'remains dead' do
        subject.should be_false
      end
    end
  end

  context 'two neighbors' do
    before do
      board.stub(:number_of_living_neighbors).with(0, 0).and_return(2)
    end

    context 'and is alive' do
      subject { described_class.new(true).tick(board).alive? }

      it 'remains alive' do
        subject.should be_true
      end
    end

    context 'and is dead' do
      subject { described_class.new(false).tick(board).alive? }

      it 'remains dead' do
        subject.should be_false
      end
    end
  end

  context 'three neighbors' do
    before do
      board.stub(:number_of_living_neighbors).with(0, 0).and_return(3)
    end

    context 'and is alive' do
      subject { described_class.new(true).tick(board).alive? }

      it 'remains alive' do
        subject.should be_true
      end
    end

    context 'and is dead' do
      subject { described_class.new(false).tick(board).alive? }

      it 'spawns' do
        subject.should be_true
      end
    end
  end

  context 'more than three neighbors' do
    before do
      board.stub(:number_of_living_neighbors).with(0, 0).and_return(6)
    end

    context 'and is alive' do
      subject { described_class.new(true).tick(board).alive? }

      it 'dies form overcrowding' do
        subject.should be_false
      end
    end

    context 'and is dead' do
      subject { described_class.new(false).tick(board).alive? }

      it 'remains dead' do
        subject.should be_false
      end
    end
  end
end
