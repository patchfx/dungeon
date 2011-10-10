require File.expand_path(File.join(File.dirname(__FILE__), '../lib/dungeon.rb'))
describe Cell do
  context 'creation' do
    let(:tile) { mock(:tile, :x => 0, :y => 0) }

    it 'sets the cell to unoccupied' do
      Cell.new(tile,tile,tile,tile).unoccupied?.should be_true
    end

    it 'sets up the initial tiles' do
      tiles = Array.new(5) { Array.new(5) { nil } }
      Cell.new(tile,tile,tile,tile).tiles.should == tiles
    end
  end

  context 'adding tiles' do
    let(:tiles) { Array.new(5) { Array.new(5) { tile } }}
    let(:tile) { mock(:tile, :belongs_to => nil, :x => 0, :y => 0) }
    let(:cell) { Cell.new(tile, tile, tile, tile) }

    it 'sets the cell as the tiles parent object' do
      tile.should_receive(:belongs_to).with(cell)
      cell.add_tiles(tiles)
    end
  end

  context 'build' do
    let(:tiles) { Array.new(5) { Array.new(5) { tile } }}
    let(:tile) { mock(:tile, :belongs_to => nil, :x => 0, :y => 0) }
    let(:cell) { Cell.new(tile,tile,tile,tile) }

    before { Cell.stub(:new => cell) }
    it 'creates a new cell' do
      Cell.should_receive(:new)
      Cell.build(0,0,tiles)
    end

    it 'adds the tiles' do
      cell.should_receive(:add_tiles).with(tiles)
      Cell.build(0,0,tiles)
    end

    it 'returns a cell' do
      Cell.build(0,0,tiles).should be_kind_of(Cell)
    end
  end
end
