require 'spec_helper'

describe JsonParser::BaseParser do
  describe '#parse' do
    it 'raises an error' do
      parser = JsonParser::BaseParser.new("")

      expect { parser.parse }.to raise_error(NotImplementedError)
    end
  end
end
