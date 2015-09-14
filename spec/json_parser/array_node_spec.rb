require 'spec_helper'

describe JsonParser::ArrayNode do
  it 'begins with an empty array value' do
    expect(JsonParser::ArrayNode.new.value).to eq([])
  end

  describe '#push' do
    it 'assigns the child\'s parent' do
      node = JsonParser::ArrayNode.new
      child = spy(:child)

      node.push(child)

      expect(child).to have_received(:parent=).with(node)
    end
  end
end
