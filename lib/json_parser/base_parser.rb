class JsonParser
  class BaseParser
    def self.parse(input)
      new(input).parse
    end

    def initialize(input)
      @input = input
    end

    def parse
      raise NotImplementedError
    end

    private
    attr_reader :input
  end
end
