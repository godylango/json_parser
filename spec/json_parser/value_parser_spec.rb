require 'spec_helper'

describe JsonParser::ValueParser do
  let(:parser) { JsonParser::ValueParser }

  it 'parses a true value' do
    value = 'true'

    expect(parser.parse(value)).to eq(true)
  end

  it 'parses a false value' do
    value = 'false'

    expect(parser.parse(value)).to eq(false)
  end

  it 'parses an integer value' do
    value = '123'

    expect(parser.parse(value)).to eq(123)
  end

  it 'parses a string value' do
    value = '"hello"'

    expect(parser.parse(value)).to eq('hello')
  end

  it 'parses a string value containing a space' do
    value = '"hello world"'

    expect(parser.parse(value)).to eq('hello world')
  end
end
