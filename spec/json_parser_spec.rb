require 'spec_helper'

describe JsonParser do
  context 'given an object' do
    it 'parses an empty object' do
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
