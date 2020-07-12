# frozen_string_literal: true

RSpec.describe 'integration specs' do
  context 'when the fixture only contains one entry' do
    let(:output) { `./parser.rb spec/fixtures/webserver_valid_1_entry.log` }

    it 'returns the unique views' do
      expect(output).to include('/about 1 unique views')
    end

    it 'returns the total views' do
      expect(output).to include('/about 1 total views')
    end
  end

  context 'when the file is not found' do
    let(:output) { `./parser.rb spec/fixtures/invalid_file` }
    it 'prints the error message' do
      expect(output).to include('File not found')
    end

    it 'returns the shell exit code 2' do
      system('./parser.rb spec/fixtures/invalid_file')

      expect($?.exitstatus).to eq(2)
    end
  end

  context 'when the file is invalid' do
    let(:output) { `./parser.rb spec/fixtures/webserver_invalid.log` }

    it 'logs an error' do
      expect(output).to include('Invalid log line')
    end

    it 'still parses and returns succesfully' do
      system('./parser.rb spec/fixtures/webserver_invalid.log')

      expect($?.exitstatus).to eq(0)
    end
  end

  context 'when the fixture only contains 10 entries' do
    let(:output) { `./parser.rb spec/fixtures/webserver_valid_10_entries.log` }

    it 'returns unique views' do
      expect(output).to include('/about 2 unique views')
    end

    it 'returns the total views' do
      expect(output).to include('/about 2 total views')
    end
  end
end
