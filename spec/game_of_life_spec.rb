require 'game_of_life'

describe GameOfLife::Cell do
  context 'alive' do
    subject { described_class.new(true) }

    it 'is alive' do
      subject.alive?.should be_true
    end

    context 'dies if no neighbors alive' do
      subject { described_class.new(true).tick }

      its(:alive?) { should be_false }
    end

    context 'dies if one neighbor is alive' do
      let (:alive) { described_class.new(true) }

      subject { described_class.new(true, [alive]).tick }

      its(:alive?) { should be_false }
    end

    context 'dies if more than three neighbors alive' do
      let (:alive) { described_class.new(true) }

      subject { described_class.new(true, [alive, alive, alive, alive]).tick }

      its(:alive?) { should be_false }
    end

    context 'lives if two neighbors' do
      let (:alive) { described_class.new(true) }

      subject { described_class.new(true, [alive, alive]).tick }

      its(:alive?) { should be_true }
    end

    context 'lives if three neighbors' do
      let (:alive) { described_class.new(true) }

      subject { described_class.new(true, [alive, alive, alive]).tick }

      its(:alive?) { should be_true }
    end
  end

  context 'dead' do
    subject { GameOfLife::Cell.new(false) }

    it 'should not be alive' do
      subject.alive?.should be_false
    end

    context 'should stay dead when two neighbors' do
      let (:alive) { described_class.new(true) }

      subject { described_class.new(false, [alive, alive]).tick }

      its(:alive?) { should be_false }
    end

    context 'becomes alive when three alive neighbors' do
      let (:alive) { described_class.new(true) }

      subject { described_class.new(false, [alive, alive, alive]).tick }

      its(:alive?) { should be_true }
    end
  end

  context 'has neighbors' do
    context 'all neighbors dead' do
      subject { described_class.new(false) }

      it 'has no alive neighbors' do
        subject.number_alive_neighbors.should == 0
      end
    end

    context 'alive neighbors' do
      let (:alive1) { described_class.new(true) }
      let (:alive2) { described_class.new(true) }
      let (:dead) { described_class.new(false) }

      subject { described_class.new(false, [alive1, dead, alive2]) }

      it 'has two alive neighbors' do
        subject.number_alive_neighbors.should == 2
      end

    end
  end


end
