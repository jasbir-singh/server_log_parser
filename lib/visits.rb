# frozen_string_literal: true

class Visits
  include Enumerable

  attr_reader :entries

  def initialize(entries: nil)
    @entries = entries || Hash.new { |h, k| h[k] = [] }
  end

  def add(url:, ip_address:)
    entries[url] = [*entries[url], ip_address]
  end
end
