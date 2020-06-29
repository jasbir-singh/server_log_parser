require './weblog_parser'

RSpec.describe WeblogParser do
  it "returns the error if the file does not exist" do
    expect {
      WeblogParser.new(file_path: 'non_exisitent_file_path')
    }.to raise_error(WeblogParser::FileNotFound)
  end
end
