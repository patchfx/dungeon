require File.expand_path(File.join(File.dirname(__FILE__), '../lib/dungeon.rb'))

describe Dungeon do
  context 'creation' do
    let(:tile) { mock(:tile) }
    before { Tile.stub(:new => tile) }

    it 'creates the initial tiles' do
      Dungeon.new(3,3).tiles.should == [
                                    [tile,tile,tile],
                                    [tile,tile,tile],
                                    [tile,tile,tile]
                                  ]
    end
  end

  context 'output' do
    it 'displays the text output' do
      Dungeon.new(3,3).to_s.should == "000\n000\n000"
    end
  end

  describe 'grid structure' do
    let(:dungeon) { Dungeon.new(20,40) }
    it 'creates cells for the grid' do
      dungeon.build_grid
      dungeon.cells.size.should == 32
    end
  end

  describe 'generate' do
    let(:dungeon) { Dungeon.new(20,40) }
    it 'builds the grid structure' do
      dungeon.should_receive(:build_grid)
      dungeon.generate
    end

    it 'builds the rooms' do
      dungeon.should_receive(:build_rooms)
      dungeon.generate
    end
  end

  describe 'build rooms' do
    let(:dungeon) { Dungeon.new(20,40) }
    let(:room) { mock(:room, :build => nil) }

    before do
      dungeon.generate
      Room.stub(:new => room)
    end

    it 'creates a new room' do
      Room.should_receive(:new).at_least(:once)
      dungeon.build_rooms
    end
  end
end
