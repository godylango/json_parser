require 'spec_helper'

describe JsonParser do
  it 'parses empty input' do
    empty = ''

    expect(JsonParser.parse(empty)).to eq(nil)
  end

  context 'given an object' do
    it 'can parse an empty object' do
      object = '{}'

      expect(JsonParser.parse(object)).to eq({})
    end
  end

  context 'given a collection' do
    it 'can parse an empty collection' do
      collection = '[]'

      expect(JsonParser.parse(collection)).to eq([])
    end

    context 'with one value' do
      it 'can parse a true value' do
        collection = '[true]'

        expect(JsonParser.parse(collection)).to eq([true])
      end

      it 'can parse a false value' do
        collection = '[false]'

        expect(JsonParser.parse(collection)).to eq([false])
      end

      it 'can parse an integer value' do
        collection = '[123]'

        expect(JsonParser.parse(collection)).to eq([123])
      end
    end

    context 'with multiple values' do
      it 'parses two true values' do
        collection = '[true,true]'

        expect(JsonParser.parse(collection)).to eq([true, true])
      end

      it 'parses mixed boolean values' do
        collection = '[true,false]'

        expect(JsonParser.parse(collection)).to eq([true, false])
      end

      it 'parses multiple integers' do
        collection = '[1,2]'

        expect(JsonParser.parse(collection)).to eq([1, 2])
      end

      it 'parses mixed integers and booleans' do
        collection = '[true,false,1]'

        expect(JsonParser.parse(collection)).to eq([true, false, 1])
      end
    end
  end
end
