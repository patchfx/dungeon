require File.expand_path(File.join(File.dirname(__FILE__), '../lib/dungeon.rb'))
describe Cell do
  context 'creation' do
    let(:tile) { mock(:tile, :x => 0, :y => 0) }

    it 'sets the cell to unoccupied' do
      Cell.new(tile,tile,tile,tile).unoccupied?.should be_true
    end
  end
end
