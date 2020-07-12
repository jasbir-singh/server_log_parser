# frozen_string_literal: true

require './lib/visits'
require './lib/server_log_line_parser'
require 'logger'

class ServerLogParser
  class FileNotFound < StandardError
  end

  attr_reader :file_path, :visits, :logger

  def initialize(file_path:, visits: Visits.new, logger: Logger.new(STDOUT))
    raise FileNotFound unless File.exist?(file_path)

    @file_path = file_path
    @visits = visits
    @logger = logger
  end

  def parse
    File.readlines(file_path).each do |line|
      visits.add(**ServerLogLineParser.parse(line))
    rescue ServerLogLineParser::InvalidLogLine => e
      logger.warn e.message

      next
    end

    visits
  end

  def self.parse(**args)
    new(**args).parse
  end
end
