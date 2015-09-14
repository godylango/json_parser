class JsonParser
  class TokenParser
    attr_reader :node

    def initialize(token)
      @token = token
      parse
    end

    def parse
      token_type, string_value = token

      if value_types.include?(token_type)
        value = value_type_converters[token_type].call(string_value)
        @node = JsonParser::ValueNode.new(value)
        @should_push = true
      elsif token_type == :array
        if string_value == '['
          @should_push = true
          @should_move_down = true
          @node = JsonParser::ArrayNode.new
        else
          @should_move_up = true
        end
      elsif token_type == :object
        if string_value == '{'
          @should_push = true
          @should_move_down = true
          @node = JsonParser::ObjectNode.new
        else
          @should_move_up = true
        end
      end
    end

    def should_push?
      !!@should_push
    end

    def should_move_up?
      !!@should_move_up
    end

    def should_move_down?
      !!@should_move_down
    end

    private
    attr_reader :token

    def value_types
      value_type_converters.keys
    end

    def value_type_converters
      {
        true: lambda { |_| true },
        false: lambda { |_| false },
        null: lambda { |_| nil },
        number: lambda { |number_string| number_string.to_i },
        string: lambda { |quoted_string| quoted_string[1..-2] }
      }
    end

  end
end
