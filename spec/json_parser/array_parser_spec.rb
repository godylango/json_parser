require 'spec_helper'

describe JsonParser::ArrayParser do
  let(:parser) { JsonParser::ArrayParser }
  it 'parses an empty collection' do
    collection = '[]'

    expect(parser.parse(collection)).to eq([])
  end

  context 'with one value' do
    it 'parses a true value' do
      collection = '[true]'

      expect(parser.parse(collection)).to eq([true])
    end

    it 'parses a false value' do
      collection = '[false]'

      expect(parser.parse(collection)).to eq([false])
    end

    it 'parses an integer value' do
      collection = '[123]'

      expect(parser.parse(collection)).to eq([123])
    end
  end

  context 'with multiple values' do
    it 'parses two true values' do
      collection = '[true,true]'

      expect(parser.parse(collection)).to eq([true, true])
    end

    it 'parses mixed boolean values' do
      collection = '[true,false]'

      expect(parser.parse(collection)).to eq([true, false])
    end

    it 'parses multiple integers' do
      collection = '[1,2]'

      expect(parser.parse(collection)).to eq([1, 2])
    end

    it 'parses mixed integers and booleans' do
      collection = '[true,false,1]'

      expect(parser.parse(collection)).to eq([true, false, 1])
    end
  end
end
