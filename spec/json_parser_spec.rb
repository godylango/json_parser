require 'spec_helper'

describe JsonParser do
  it 'parses empty input' do
    empty = ''

    expect(JsonParser.parse(empty)).to eq(nil)
  end

  it 'parses an empty collection' do
    collection = '[]'

    expect(JsonParser.parse(collection)).to eq([])
  end

  it 'parses a collection with a value' do
    collection = '[true]'

    expect(JsonParser.parse(collection)).to eq([true])
  end

  it 'parses a collection with a value' do
    collection = '[false]'

    expect(JsonParser.parse(collection)).to eq([false])
  end

  it 'parses a collection with an integer value' do
    collection = '[123]'

    expect(JsonParser.parse(collection)).to eq([123])
  end

  it 'parses a collection with an string value' do
    collection = '["yolo! \'hello world\'"]'

    expect(JsonParser.parse(collection)).to eq(["yolo! \'hello world\'"])
  end

  it 'parses a collection with two values' do
    collection = '[123, true]'

    expect(JsonParser.parse(collection)).to eq([123, true])
  end

  it 'parses a collection with a nested array' do
    collection = '[123, [456, [789], true]]'

    expect(JsonParser.parse(collection)).to eq([123, [456, [789], true]])
  end

  it 'parses a collection with a nested array' do
    collection = '[123, [456, [false, 987], [789], "hey"]]'

    expect(JsonParser.parse(collection)).to eq([123, [456, [false, 987], [789], 'hey']])
  end
end
