require 'spec_helper'

describe JsonParser::TokenParser do
  context 'given a value type token' do
    [[[:true, 'true'], true],
     [[:false, 'false'], false],
     [[:null, 'null'], nil]].each do |token, expected_value|
      context "#{token}" do
        it 'constructs a ValueNode' do
          expect(parse_token(token).node).to be_a(JsonParser::ValueNode)
        end

        it 'the constructed ValueNode has the correct value' do
          expect(parse_token(token).node.value).to eq(expected_value)
        end

        it 'advises you to push the parsed node' do
          expect(parse_token(token).should_push?).to be_truthy
        end

        it 'does not advise you to move the pointer up' do
          expect(parse_token(token).should_move_up?).to be_falsey
        end
      end
    end
  end

  context 'given a value type token representing an integer' do
    it 'constructs a ValueNode' do
      expect(parse_token([:number, '123']).node).to be_a(JsonParser::ValueNode)
    end

    it 'the constructed ValueNode has the correct value' do
      expect(parse_token([:number, '123']).node.value).to eq(123)
    end
  end

  context 'given a value type token representing a string' do
    it 'constructs a ValueNode' do
      expect(parse_token([:string, '"yolo"']).node).to be_a(JsonParser::ValueNode)
    end

    it 'the constructed ValueNode has the correct value' do
      expect(parse_token([:string, '"yolo"']).node.value).to eq('yolo')
    end
  end

  context 'given a closing bracket token' do
    it 'advises you to move the pointer up' do
      expect(parse_token([:array, ']']).should_move_up?).to be_truthy
    end

    it 'should not advise you to push the parsed node' do
      expect(parse_token([:array, ']']).should_push?).to be_falsey
    end

    it 'should not have a node' do
      expect(parse_token([:array, ']']).node).to be_nil
    end
  end

  context 'given a opening bracket token' do
    it 'advises you to push' do
      expect(parse_token([:array, '[']).should_push?).to be_truthy
    end

    it 'advises you to push' do
      expect(parse_token([:array, '[']).should_move_down?).to be_truthy
    end

    it 'constructs an ArrayNode' do
      expect(parse_token([:array, '[']).node).to be_a(JsonParser::ArrayNode)
    end

    it 'the constructed ArrayNode has the correct value' do
      expect(parse_token([:array, '[']).node.value).to eq([])
    end
  end

  def parse_token(token)
    JsonParser::TokenParser.new(token)
  end
end
