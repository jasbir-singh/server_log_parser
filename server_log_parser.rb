#!/usr/bin/env ruby
# frozen_string_literal: true

require './lib/visit_reports'
require './lib/server_log_parser'

if __FILE__ == $PROGRAM_NAME
  parser = ServerLogParser.parse(file_path: ARGV[0])

  puts '__Unique views__'
  pp VisitReports::UniqueViewsByURL.generate(parser.visits)

  puts '__Total views__'
  pp VisitReports::TotalViewsByURL.generate(parser.visits)
end
