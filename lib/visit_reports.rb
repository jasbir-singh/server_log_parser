# frozen_string_literal: true

module VisitReports
  attr_reader :visits

  def initialize(visits:)
    @visits = visits
  end

  def generated_data
    @generated_data ||= generate.sort_by { |k, v| - v }.to_h
  end

  def to_s
    generated_data.map do |key, val|
      "#{key} #{val} #{suffix}".strip
    end.join("\n")
  end
end
