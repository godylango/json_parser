require 'spec_helper'

describe JsonParser::ValueNode do
  it 'can hold a true value' do
    expect(JsonParser::ValueNode.new(true).value).to eq(true)
  end

  it 'can keep track of its parent' do
    node = JsonParser::ValueNode.new(true)
    parent = double(:parent)

    node.parent = parent

    expect(node.parent).to eq(parent)
  end
end
