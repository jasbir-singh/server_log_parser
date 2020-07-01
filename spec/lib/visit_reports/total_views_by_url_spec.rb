# frozen_string_literal: true
require './lib/visit_reports/total_views_by_url'

RSpec.describe VisitReports::TotalViewsByURL do
  let(:visits) do
    Visits.new.tap do |visits|
      visits.add(url: '/about', ip_address: '127.0.0.1')
      visits.add(url: '/about', ip_address: '127.0.0.1')
      visits.add(url: '/about/2', ip_address: '127.0.0.1')
    end
  end

  describe '#to_s' do
    subject { described_class.new(visits: visits).to_s }

    it 'returns the total views for /about page' do
      expect(subject).to include('/about 2 total views')
    end

    it 'returns the total views for /about/2 page' do
      expect(subject).to include('/about/2 1 total views')
    end
  end
end
