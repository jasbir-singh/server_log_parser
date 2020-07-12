# frozen_string_literal: true

require './lib/visits'

RSpec.describe Visits do
  subject { Visits.new }

  describe '.add' do
    before do
      subject.add(url: '/about', ip_address: '127.0.0.1')
    end

    it 'adds the visits to the internal hash' do
      expect(subject.entries).to include({ '/about' => ['127.0.0.1'] })
    end
  end

  describe '.each' do
    before do
      subject.add(url: '/about', ip_address: '127.0.0.1')
      subject.add(url: '/about/1', ip_address: '127.0.0.1')
    end

    it 'implements enumerable interface' do
      expect(subject.to_a).to include({ url: '/about', ip_addresses: ['127.0.0.1'] })
    end

    it 'implements enumerable interface' do
      expect(subject.to_a).to include({ url: '/about/1', ip_addresses: ['127.0.0.1'] })
    end
  end
end
