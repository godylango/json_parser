require 'spec_helper'

describe JsonParser::Tokenizer do
  it 'tokenizes the empty string' do
    expect_tokenization('', [])
  end

  context 'given input with a value' do
    context 'that is a number' do
      it 'tokenizes an integer' do
        expect_tokenization('10', [[:number, '10']])
      end
    end

    it 'tokenizes a string' do
      expect_tokenization('"hello"', [[:string, '"hello"']])
    end

    it 'tokenizes a string with crazy characters' do
      expect_tokenization('"hello,\\ world!123 45\""', [[:string, '"hello,\\ world!123 45\""']])
    end

    it 'tokenizes true value' do
      expect_tokenization('true', [[:true, 'true']])
    end

    it 'tokenizes false value' do
      expect_tokenization('false', [[:false, 'false']])
    end

    it 'tokenizes null value' do
      expect_tokenization('null', [[:null, 'null']])
    end

  end

  context 'given input with an array' do
    it 'tokenizes an empty array' do
      expect_tokenization('[]', [[:array, '['], [:array, ']']])
    end

    it 'tokenizes a nested empty array' do
      nested_empty_array = '[[]]'
      expected_tokenization = [[:array, '['],
                               [:array, '['],
                               [:array, ']'],
                               [:array, ']']]
      expect_tokenization(nested_empty_array, expected_tokenization)
    end

    it 'tokenizes an array of strings' do
      input = '["hello", "world!"]'
      tokens = [[:array, '['],
                [:string, '"hello"'],
                [:comma, ','],
                [:space, ' '],
                [:string, '"world!"'],
                [:array, ']']]
      expect_tokenization(input, tokens)
    end
  end

  context 'given input with an object' do
    it 'tokenizes an empty object' do
      expect_tokenization('{}', [[:object, '{'], [:object, '}']])
    end

    it 'tokenizes a nested object' do
      expect_tokenization('{"blur": {}}', [[:object, '{'],
                                           [:string, '"blur"'],
                                           [:colon, ':'],
                                           [:space, ' '],
                                           [:object, '{'],
                                           [:object, '}'],
                                           [:object, '}']])
    end
  end

  def expect_tokenization(input, expected_tokens)
    expect(JsonParser::Tokenizer.tokenize(input)).to eq(expected_tokens)
  end
end
