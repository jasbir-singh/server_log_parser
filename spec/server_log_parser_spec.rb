# frozen_string_literal: true

require './server_log_parser'

RSpec.describe ServerLogParser do
  subject { ServerLogParser.new(file_path: file_path) }

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
      let(:file_path) { './spec/fixtures/webserver1.log' }

      it 'does not raise an error' do
        expect do
          subject
        end.to_not raise_error(ServerLogParser::FileNotFound)
      end

      it 'sets the file_path' do
        expect(subject.file_path).to eq(file_path)
      end
    end
  end

  describe '.parse' do
    let(:file_path) { './spec/fixtures/webserver1.log' }

    context 'when the log file is invalid' do
      let(:file_path) { './spec/fixtures/webserver_invalid.log' }

      it 'parses the file into visits' do
        expect {
          subject.parse
        }.to raise_error(IPAddr::InvalidAddressError)
      end
    end
  end
end
