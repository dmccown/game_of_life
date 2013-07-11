require 'board'

describe GameOfLife::Board do

  context 'populating cells' do
    let(:cell) { mock }
    subject { described_class.new(3, 3, 0.1) }

    it 'can populate a cell' do
      subject[1][1] = cell

      subject[1][1].should == cell
    end

  end

  context 'cycle game' do
    let(:new_cell) { mock 'new cell' }
    let(:cell) { mock 'cell', tick: new_cell }
    subject { described_class.new(1, 1, 0.1) }

    before do
      subject.each_with_index do | ignore, x, y |
        subject[x][y] = cell
      end
    end

    it 'should tick each cell' do
      cell.should_receive(:tick)

      subject.cycle_game
    end

    it 'should create a new board' do
      subject.cycle_game[0][0].should == new_cell
    end
  end

  context 'counts number of living neighbors' do
    let(:alive_cell) { mock 'alive', :alive? => true }
    let(:dead_cell) { mock 'dead', :alive? => false }

    before do
      GameOfLife::Cell.stub(:new).and_return(dead_cell)
    end

    context 'no living neighbors' do
      subject { described_class.new(3, 3, 0.1).number_of_living_neighbors(1, 1) }

      it 'returns 0' do
        subject.should == 0
      end
    end

    context 'living neighbors' do
      subject { described_class.new(4, 4, 0.1) }

      before do
        subject[1][1] = alive_cell
        subject[1][2] = alive_cell
        subject[2][1] = alive_cell
        subject[2][2] = alive_cell
      end

      it 'should count all neighbors' do
        count = subject.number_of_living_neighbors 1, 1

        count.should == 3
      end

      it 'should count all neighbors' do
        count = subject.number_of_living_neighbors 1, 2

        count.should == 3
      end

      it 'should not exceed boundary' do
        count = subject.number_of_living_neighbors 0, 0

        count.should == 1
      end
    end
  end

end
