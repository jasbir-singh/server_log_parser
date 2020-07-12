# frozen_string_literal: true

require_relative '../visit_reports'

module VisitReports
  class TotalViewsByURL
    include VisitReports

    private

    def generate
      visits.map do |visit|
        [
          visit[:url], visit[:ip_addresses].length
        ]
      end.to_h
    end

    def suffix
      'total views'
    end
  end
end
