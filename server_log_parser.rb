# frozen_string_literal: true
require 'ipaddr'

class Visits
  attr_reader :visits

  def initialize()
    @visits = Hash.new { |h, k| h[k] = [] }
  end

  def add(url:, ip_address:)
    visits[url] = [*visits[url], visit]
  end
end

class ServerLogParser
  class FileNotFound < StandardError
  end

  attr_reader :file_path, :visits

  def initialize(file_path:)
    raise FileNotFound unless File.exist?(file_path)

    @file_path = file_path

    # Each key of the visits is an empty array
    @visits = Visits.new
  end

  def parse
    File.readlines(file_path).each do |line|
      url, ip_address = line.split(" ")

      visits.add(url: url, ip_address: IPAddr.new(ip_address))
    end
  end
end
