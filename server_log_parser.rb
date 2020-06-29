# frozen_string_literal: true

class ServerLogParser
  class FileNotFound < StandardError
  end

  def initialize(file_path:)
    raise FileNotFound unless File.exist?(file_path)

    @file_path = file_path
  end
end
