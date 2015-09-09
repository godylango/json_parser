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
    it 'parses the empty collection' do
      collection = '[]'

      expect(JsonParser.parse(collection)).to eq([])
    end
  end
end
