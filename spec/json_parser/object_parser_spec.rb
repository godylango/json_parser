require 'spec_helper'

describe JsonParser::ObjectParser do
  let(:parser) { JsonParser::ObjectParser }
  it 'parses an empty object' do
    object = '{}'

    expect(parser.parse(object)).to eq({})
  end

  it 'parses a single key-value pair' do
    object = '{"foo":true}'

    expect(parser.parse(object)).to eq({ "foo" => true })
  end

  it 'parses a different key-value pair' do
    object = '{"bar":false}'

    expect(parser.parse(object)).to eq({ "bar" => false })
  end

  it 'parses a key-value pair with number' do
    object = '{"bar":123}'

    expect(parser.parse(object)).to eq({ "bar" => 123 })
  end

  it 'parses a key-value pair with string' do
    object = '{"bar":"fizz"}'

    expect(parser.parse(object)).to eq({ "bar" => "fizz" })
  end

  it 'parses multiple key-value pairs' do
    object = '{"foo":1,"bar":"fizz"}'

    expect(parser.parse(object)).to eq({ "foo" => 1, "bar" => "fizz" })
  end
end
