module VisitReports
  class UniqueViewsByURL
    def self.generate(visits)
      visits.map do |visit|
        [
          visit[:url], visit[:ip_addresses].uniq.length
        ]
      end.to_h
    end
  end
end
