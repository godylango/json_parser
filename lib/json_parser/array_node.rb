class JsonParser
  class ArrayNode
    def initialize
      @nodes = []
    end

    attr_accessor :parent

    def push(node)
      @nodes << node
      node.parent = self
    end

    def value
      @nodes.map(&:value)
    end
  end
end
