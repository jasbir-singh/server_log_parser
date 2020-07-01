require_relative '../visit_reports'

module VisitReports
  class UniqueViewsByURL
    include VisitReports

    private

    def generate
      @generated_data ||= visits.map do |visit|
        [
          visit[:url], visit[:ip_addresses].uniq.length
        ]
      end.to_h
    end

    def suffix
      'unique views'
    end
  end
end
