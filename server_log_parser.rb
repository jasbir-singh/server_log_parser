#!/usr/bin/env ruby
# frozen_string_literal: true

require './lib/server_log_parser'
require './lib/visit_reports/unique_views_by_url'
require './lib/visit_reports/total_views_by_url'

if __FILE__ == $PROGRAM_NAME
  visits = ServerLogParser.parse(file_path: ARGV[0])

  puts '-' * 20
  unique_views = VisitReports::UniqueViewsByURL.new(visits: visits)
  puts unique_views

  puts '-' * 20
  total_views = VisitReports::TotalViewsByURL.new(visits: visits)
  puts total_views
end
