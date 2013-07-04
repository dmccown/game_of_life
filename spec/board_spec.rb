require 'game_of_life'

describe GameOfLife::Board do

  context 'populating cells' do
    let(:cell) { mock }
    subject { described_class.new(3, 3) }

    it 'can populate a cell' do
      subject[1][1] = cell

      subject[1][1].should == cell
    end

    it 'should have dead cells by default' do
      subject.each do | row |
        row.each do | cell|
          cell.alive?.should be_false
        end
      end
    end

    it 'should have cells with correct coordinates' do
      subject.each_with_index do | row, x |
        row.each_with_index do | cell, y |
          cell.x.should == x
          cell.y.should == y
        end
      end
    end
  end

  context 'counts number of living neighbors' do

    context 'no living neighbors' do
      subject { described_class.new(3, 3).number_of_living_neighbors(1, 1) }

      it 'returns 0' do
        subject.should == 0
      end
    end
  end
end
