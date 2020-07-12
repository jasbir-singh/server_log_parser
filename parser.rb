#!/usr/bin/env ruby
# frozen_string_literal: true

require './lib/server_log_parser'
require './lib/visit_reports/unique_views_by_url'
require './lib/visit_reports/total_views_by_url'

class Parser
  attr_reader :visits, :file_path

  ERROR_MESSAGES = {
    help_message: 'usage: ./parser.rb [file...]',
    misuse_error: 'File not found :('
  }.freeze

  # http://www.tldp.org/LDP/abs/html/exitcodes.html
  SHELL_ERROR_MESSAGES = {
    general_error: 1,
    misuse_error: 2,
  }

  def initialize(file_path)
    @file_path = file_path
    validate_file

    begin
      @visits = ServerLogParser.parse(file_path: file_path)
    rescue ServerLogParser::FileNotFound
      handle_error(:misuse_error)
    end
  end

  def unique_views
    puts '-' * 20
    puts VisitReports::UniqueViewsByURL.new(visits: visits)
    puts '-' * 20
  end

  def total_views
    puts '-' * 20
    puts VisitReports::TotalViewsByURL.new(visits: visits)
    puts '-' * 20
  end

  private

  def handle_error(error)
    puts ERROR_MESSAGES[error]
    exit(SHELL_ERROR_MESSAGES[error])
  end

  def validate_file
    return if file_path

    handle_error(:general_error)
  end
end

if __FILE__ == $PROGRAM_NAME
  parser = Parser.new(ARGV[0])
  parser.unique_views
  parser.total_views
end
