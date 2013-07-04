require 'board'

describe GameOfLife::Board do

  context 'populating cells' do
    let(:cell) { mock }
    subject { described_class.new(3, 3) }

    it 'can populate a cell' do
      subject[1][1] = cell

      subject[1][1].should == cell
    end

    it 'should have cells with correct coordinates' do
      subject.each_with_index do | cell, x, y |
        cell.x.should == x
        cell.y.should == y
      end
    end
  end

  context 'cycle game' do
    let(:new_cell) { mock 'new cell' }
    let(:cell) { mock 'cell', tick: new_cell, x: 0, y: 0 }
    subject { described_class.new(1, 1) }

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

    context 'no living neighbors' do
      subject { described_class.new(3, 3).number_of_living_neighbors(1, 1) }

      it 'returns 0' do
        subject.should == 0
      end
    end

    context 'living neighbors' do
      let(:cell) { mock 'cell', :alive? => true }
      subject { described_class.new(3, 3) }

      before do
        subject[2][2] = cell
      end

      it 'should count all neighbors' do
        count = subject.number_of_living_neighbors 1, 1

        count.should == 1
      end

      it 'should not exceed boundary' do
        count = subject.number_of_living_neighbors 0, 0

        count.should == 0
      end
    end
  end

end
