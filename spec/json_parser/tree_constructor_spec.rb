require 'spec_helper'

describe JsonParser::TreeConstructor do
  it 'returns nil when given no tokens' do
    expect(JsonParser::TreeConstructor.new([]).root).to be_nil
  end

  it 'returns the first parsed token\'s node as the root' do
    parsed_token = create_parsed_token
    expect(JsonParser::TreeConstructor.new([parsed_token]).root).to eq(parsed_token.node)
  end

  it 'pushes when the second node says to' do
    root_token = create_parsed_token
    child_token = create_parsed_token(should_push: true)

    JsonParser::TreeConstructor.new([root_token, child_token])

    expect(root_token.node).to have_received(:push).with(child_token.node)
  end

  it 'pushes the third node into the first' do
    root_token = create_parsed_token
    child_token = create_parsed_token(should_push: true)
    sibling_token = create_parsed_token(should_push: true)

    JsonParser::TreeConstructor.new([root_token, child_token, sibling_token])

    expect(root_token.node).to have_received(:push).with(sibling_token.node)
  end


  it 'pushes the third node into the second when told to move down' do
    root_token = create_parsed_token
    child_token = create_parsed_token(should_push: true, should_move_down: true)
    grandchild_token = create_parsed_token(should_push: true)

    JsonParser::TreeConstructor.new([root_token, child_token, grandchild_token])

    expect(child_token.node).to have_received(:push).with(grandchild_token.node)
  end

  it 'pushes the fourth node into the second when told to move down then up' do
    root_token = create_parsed_token
    child_token = create_parsed_token(should_push: true, should_move_down: true)
    grandchild_token = create_parsed_token(should_move_up: true)
    sibling_token = create_parsed_token(should_push: true)
    allow(child_token.node).to receive(:parent) { root_token.node }

    JsonParser::TreeConstructor.new([root_token, child_token, grandchild_token, sibling_token])

    expect(root_token.node).to have_received(:push).with(child_token.node)
    expect(root_token.node).to have_received(:push).with(sibling_token.node)
  end

  def create_parsed_token(should_move_down: false, should_move_up: false, should_push: false)
    parsed_token = double("parsed_token")
    node = spy("node")
    allow(parsed_token).to receive(:node) { node }

    allow(parsed_token).to receive(:should_move_down?) { should_move_down }
    allow(parsed_token).to receive(:should_move_up?) { should_move_up }
    allow(parsed_token).to receive(:should_push?) { should_push }

    parsed_token
  end
end
