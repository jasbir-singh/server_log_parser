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
end
