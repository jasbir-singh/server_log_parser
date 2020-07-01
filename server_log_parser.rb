# frozen_string_literal: true

require 'pry'
require './lib/server_log_parser'

if __FILE__ == $PROGRAM_NAME
  binding.pry
  ServerLogParser.new(file_path: ARGV[0])
end
