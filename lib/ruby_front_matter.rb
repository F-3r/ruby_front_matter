require "ruby_front_matter/version"

module RubyFrontMatter
  class Parser
    attr_reader :parser

    def initialize(options = {})
      options = {delimiter: '---', parser: YAML}.merge(options)
      @delimiter = options[:delimiter]
      @parser = options[:parser]
    end

    def parse(string = '')
      res = [{},'']
      res[1] = string.lstrip.gsub(/#{@delimiter}(.*)#{@delimiter}/m) do |match|
        res[0] = @parser.load($~.captures.first.strip)
        ''
      end.strip
      res
    end
  end
end
