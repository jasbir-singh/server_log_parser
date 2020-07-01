module ServerLogLineParser
  def self.parse(line)
    url, ip_address = line.split(' ')

    {
      url: url,
      ip_address: ip_address
    }
  end
end
