# frozen_string_literal: true

require './lib/visits'
require './lib/server_log_line_parser'

class ServerLogParser
  class FileNotFound < StandardError
  end

  attr_reader :file_path, :visits

  def initialize(file_path:, visits: Visits.new)
    raise FileNotFound unless File.exist?(file_path)

    @file_path = file_path
    @visits = visits
  end

  def parse
    File.readlines(file_path).each do |line|
      visits.add(**ServerLogLineParser.parse(line))
    end

    visits
  end

  def self.parse(**args)
    new(**args).parse
  end
end
