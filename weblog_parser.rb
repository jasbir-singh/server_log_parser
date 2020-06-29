class WeblogParser
  class FileNotFound < StandardError
  end

  def initialize(file_path:)
    raise FileNotFound unless File.exists?(file_path)

    @file_path = file_path
  end
end
