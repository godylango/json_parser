class JsonParser
  def self.parse(input)
    new(input).parse
  end

  def initialize(input)
    tokens = Tokenizer.tokenize(input)

    parsed_tokens = tokens.map do |token|
      TokenParser.new(token)
    end

    @root = TreeConstructor.new(parsed_tokens).root
  end

  def parse
    if root
      root.value
    end
  end

  private

  attr_reader :tokens, :root
end

require 'requirements'
