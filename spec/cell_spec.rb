require File.expand_path(File.join(File.dirname(__FILE__), '../lib/dungeon.rb'))
describe Cell do
  context 'creation' do
    it 'sets the cell to unoccupied' do
      Cell.new([1,2],[2,3],[3,4],[4,5]).unoccupied?.should be_true
    end
  end
end
