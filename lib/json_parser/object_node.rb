class JsonParser
  class ObjectNode
    def initialize
      @nodes = []
    end

    attr_accessor :parent

    def push(node)
      @nodes << node
      node.parent = self
    end

    def value
      @nodes.map(&:value).each_slice(2).to_h
    end
  end
end
