class JsonParser
  class TreeConstructor
    def initialize(parsed_tokens)
      @pointer = @root = get_root(parsed_tokens)
      parsed_tokens.each { |token| handle_token(token) }
    end

    attr_reader :root

    private

    attr_accessor :pointer

    def handle_token(token)
      if token.should_push?
        pointer.push(token.node)
      end

      if token.should_move_down?
        self.pointer = token.node
      elsif token.should_move_up?
        self.pointer = pointer.parent
      end
    end

    def get_root(tokens)
      first_token = tokens.shift
      if first_token
        first_token.node
      end
    end
  end
end
