module VisitReports
  class TotalViewsByURL
    def self.generate(visits)
      visits.map do |visit|
        [
          visit[:url], visit[:ip_addresses].length
        ]
      end.to_h
    end
  end
end
