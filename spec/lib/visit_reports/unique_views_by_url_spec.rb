# frozen_string_literal: true

require './lib/visit_reports'

RSpec.describe VisitReports::UniqueViewsByURL do
  let(:visits) do
    Visits.new.tap do |visits|
      visits.add(url: '/about', ip_address: '127.0.0.1')
      visits.add(url: '/about', ip_address: '127.0.0.1')
      visits.add(url: '/about/2', ip_address: '127.0.0.1')
    end
  end

  describe '#generate' do
    subject { described_class.generate(visits) }

    it 'returns the unique views' do
      expect(subject).to eq({ '/about' => 1, '/about/2' => 1 })
    end
  end
end
