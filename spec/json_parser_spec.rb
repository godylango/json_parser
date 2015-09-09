require 'spec_helper'

describe JsonParser do
  it 'parses empty input' do
    empty = ''

    expect(JsonParser.parse(empty)).to eq(nil)
  end

  context 'given an object' do
    it 'parses an empty object' do
      object = '{}'

      expect(JsonParser.parse(object)).to eq({})
    end
  end

  context 'given a collection' do
    it 'parses an empty collection' do
      collection = '[]'

      expect(JsonParser.parse(collection)).to eq([])
    end

    it 'parses a collection of booleans and integers' do
      collection = '[true,false,1,"foo"]'

      expect(JsonParser.parse(collection)).to eq([true, false, 1, 'foo'])
    end
  end
end
