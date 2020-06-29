# frozen_string_literal: true

require './server_log_parser'

RSpec.describe ServerLogParser do
  describe 'constructor' do
    it 'returns the error if the file does not exist' do
      expect do
        ServerLogParser.new(file_path: 'non_exisitent_file_path')
      end.to raise_error(ServerLogParser::FileNotFound)
    end
  end
end
