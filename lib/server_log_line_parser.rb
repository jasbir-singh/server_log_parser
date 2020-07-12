# frozen_string_literal: true

require 'uri'

module ServerLogLineParser
  class InvalidLogLine < StandardError
    attr_reader :line

    def initialize(line)
      @line = line

      super
    end

    def message
      "Invalid log line: #{line}"
    end
  end

  def self.parse(line)
    splitted_words = line.split(' ')

    raise InvalidLogLine, line if splitted_words.length > 2

    url, ip_address = splitted_words

    raise InvalidLogLine, line if url =~ URI::DEFAULT_PARSER.make_regexp

    {
      url: url,
      ip_address: ip_address
    }
  end
end
