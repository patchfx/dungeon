require_relative '../lib/tile.rb'

describe Tile do
  context 'creation' do
    subject { Tile.new(3,4) }
    it 'has a default code of 0' do
      subject.code.should == '0'
    end

    it 'sets the x coord' do
      subject.x.should == 3
    end

    it 'sets the y coord' do
      subject.y.should == 4
    end

    it 'is available' do
      subject.available?.should be_true
    end
  end
end
