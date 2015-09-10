class JsonParser
  class Tokenizer
    def self.tokenize(input)
      @scanner = StringScanner.new(input)
      tokens = []

      until @scanner.eos?
        matchers.detect do |type, matcher|
          if @scanner.scan(matcher)
            tokens << [type, @scanner.matched]
          end
        end
      end

      tokens
    end

    def self.matchers
      [[:array, /[\[\]]/],
       [:number, /\d+/],
       [:string, /"(?:[^"\\]|\\.)*"/],
       [:comma, /,/],
       [:colon, /:/],
       [:object, /[{}]/],
       [:space, /\s/],
       [:true, /true/],
       [:false, /false/],
       [:null, /null/],
       [:unknown, /./]]
    end

    private
    attr_reader :scanner
  end
end
