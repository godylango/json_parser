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

    it 'changes the value' do
      node = JsonParser::ArrayNode.new
      child = spy(:child)
      allow(child).to receive(:parent=).with(node)
      allow(child).to receive(:value) { 'foo' }

      node.push(child)
      node.push(child)

      expect(node.value).to eq(['foo', 'foo'])
    end
  end
end
