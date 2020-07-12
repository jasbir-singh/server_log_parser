# frozen_string_literal: true

require './lib/visits'
require './lib/visit_reports/unique_views_by_url'

RSpec.describe VisitReports::UniqueViewsByURL do
  let(:visits) do
    Visits.new.tap do |visits|
      visits.add(url: '/about', ip_address: '127.0.0.1')
      visits.add(url: '/about', ip_address: '127.0.0.1')
      visits.add(url: '/about/2', ip_address: '127.0.0.1')
    end
  end

  describe '#generated_data' do
    subject { described_class.new(visits: visits).generated_data }

    it 'returns the unique views for /about' do
      expect(subject).to include('/about' => 1)
    end

    it 'differenties between /about and /about/2' do
      expect(subject).to include('/about/2' => 1)
    end
  end

  describe '#to_s' do
    subject { described_class.new(visits: visits).to_s }

    it 'returns the output sorted by the views count' do
      expect(subject).to eq("/about 1 unique views\n/about/2 1 unique views")
    end
  end
end
