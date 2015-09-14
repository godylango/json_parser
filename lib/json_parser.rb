class JsonParser
  def self.parse(input)
    new(input).parse
  end

  def initialize(input)
    @tokens = Tokenizer.tokenize(input)
    @root = get_root
  end

  def parse
    construct_tree

    if root
      root.value
    end
  end

  private

  attr_reader :tokens, :root

  def construct_tree
    pointer = @root

    tokens.each do |token|
      parsed = TokenParser.new(token)
      if parsed.should_push?
        pointer.push(parsed.node)
      end

      if parsed.should_move_down?
        pointer = parsed.node
      elsif parsed.should_move_up?
        pointer = pointer.parent
      end
    end
  end

  def get_root
    if tokens.shift && tokens.pop
      root = ArrayNode.new
    end
  end
end

require 'requirements'
