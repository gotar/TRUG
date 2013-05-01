require_relative '../../models/rug.rb'

describe Rug do
  before :each do
    stub_const('Rug::RUGS', {krug: 'krug.pl'})
  end

  describe '.all' do
    it 'should be array' do
      described_class.all.should be_an_instance_of Array
    end
    it 'should contain only Rug objects' do
      described_class.all.each { |rug| rug.should be_an_instance_of Rug }
    end
  end

  describe '#name' do
    subject { described_class.all.first }
    its(:name) { should be == 'krug' }
  end

  describe '#url' do
    subject { described_class.all.first }
    its(:url) { should be == 'krug.pl' }
  end
end
