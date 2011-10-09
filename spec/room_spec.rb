require File.expand_path(File.join(File.dirname(__FILE__), '../lib/dungeon.rb'))

describe Room do
  context 'build' do
    let(:room) { Room.new(0,0,3,3,cell) }
    let(:cell) { mock(:cell) }
    let(:tile) { mock(:tile) }

    before{ Tile.stub(:new => tile) }

    it 'creates tiles for the rooms dimensions' do
      room.build
      room.tiles.should == [
                            [tile,tile,tile],
                            [tile,tile,tile],
                            [tile,tile,tile]
                           ]
    end
  end
end
