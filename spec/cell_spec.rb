require 'cell'

describe GameOfLife::Cell do

  context 'less than two neighbors' do
    context 'and is alive' do
      subject { described_class.new(true).tick(1).alive? }

      it 'starves' do
        subject.should be_false
      end
    end

    context 'and is dead' do
      subject { described_class.new(false).tick(1).alive? }

      it 'remains dead' do
        subject.should be_false
      end
    end
  end

  context 'two neighbors' do
    context 'and is alive' do
      subject { described_class.new(true).tick(2).alive? }

      it 'remains alive' do
        subject.should be_true
      end
    end

    context 'and is dead' do
      subject { described_class.new(false).tick(2).alive? }

      it 'remains dead' do
        subject.should be_false
      end
    end
  end

  context 'three neighbors' do
    context 'and is alive' do
      subject { described_class.new(true).tick(3).alive? }

      it 'remains alive' do
        subject.should be_true
      end
    end

    context 'and is dead' do
      subject { described_class.new(false).tick(3).alive? }

      it 'spawns' do
        subject.should be_true
      end
    end
  end

  context 'more than three neighbors' do
    context 'and is alive' do
      subject { described_class.new(true).tick(6).alive? }

      it 'dies form overcrowding' do
        subject.should be_false
      end
    end

    context 'and is dead' do
      subject { described_class.new(false).tick(6).alive? }

      it 'remains dead' do
        subject.should be_false
      end
    end
  end
end
