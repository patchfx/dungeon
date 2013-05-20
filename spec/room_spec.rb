require_relative '../lib/dungeon.rb'

describe Room do
  context 'build' do
    let(:room) { Room.new(0,0,3,3,cell) }
    let(:cell) { mock(:cell, :add_room => nil) }
    let(:tile) { mock(:tile) }

    before{ Tile.stub(:new => tile) }

    context 'build' do
      let(:room) { Room.new(5,3,10,20,cell) }
      let(:cell) { mock(:cell) }
      it 'adds the room to the parent cell' do
        cell.should_receive(:add_room).with(room, 5, 3, 10, 20)
        room.build
      end
    end
  end
end
