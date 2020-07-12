# frozen_string_literal: true

require './lib/server_log_parser'

RSpec.describe ServerLogParser do
  let(:visits) { Visits.new }
  subject { ServerLogParser.new(file_path: file_path, visits: visits) }

  describe 'constructor' do
    let(:file_path) { 'non_exisitent_file_path' }

    context 'file is non-existent' do
      it 'returns the error if the file does not exist' do
        expect do
          subject
        end.to raise_error(ServerLogParser::FileNotFound)
      end
    end

    context 'when the file path is valid' do
      let(:file_path) { './spec/fixtures/webserver_valid_10_entries.log' }

      it 'does not raise an error' do
        expect do
          subject
        end.not_to raise_error
      end

      it 'sets the file_path' do
        expect(subject.file_path).to eq(file_path)
      end
    end
  end

  describe '.parse' do
    let(:file_path) { './spec/fixtures/webserver_valid_1_entry.log' }

    context 'when the file is valid' do
      it 'parses and then adds the visits' do
        expect(visits).to receive(:add).with(url: '/about', ip_address: '802.683.925.780')

        subject.parse
      end
    end
  end
end
