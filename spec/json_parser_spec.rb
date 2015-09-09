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
    end

    context 'with two values' do
      it 'can parse two true values' do
        collection = '[true,true]'

        expect(JsonParser.parse(collection)).to eq([true, true])
      end
    end
  end
end
