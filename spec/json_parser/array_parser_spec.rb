require 'spec_helper'

describe JsonParser::ArrayParser do
  let(:parser) { JsonParser::ArrayParser }
  it 'parses an empty collection' do
    collection = '[]'

    expect(parser.parse(collection)).to eq([])
  end

  it 'passes values to JsonParser::ValueParser' do
    collection = '[1]'
    allow(JsonParser::ValueParser).to receive(:parse).with('1')

    parser.parse(collection)

    expect(JsonParser::ValueParser).to have_received(:parse).with('1')
  end

  it 'parses a boolean value' do
    collection = '[true]'

    expect(parser.parse(collection)).to eq([true])
  end

  it 'parses an integer value' do
    collection = '[123]'

    expect(parser.parse(collection)).to eq([123])
  end

  it 'parses a string value' do
    collection = '["hello world"]'

    expect(parser.parse(collection)).to eq(['hello world'])
  end

  it 'parses multiple mixed values' do
    collection = '[true,false,1,"hello world"]'

    expect(parser.parse(collection)).to eq([true, false, 1, 'hello world'])
  end
end
