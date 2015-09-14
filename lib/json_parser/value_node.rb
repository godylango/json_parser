class JsonParser
  class ValueNode
    def initialize(value)
      @value = value
    end

    attr_accessor :parent
    attr_reader :value
  end
end
