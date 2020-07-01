module VisitReports
  attr_reader :visits

  def initialize(visits:)
    @visits = visits
  end

  def generated_data
    @generated_data ||= generate
  end

  def to_s
    generated_data.map do |key, val|
      "#{key} #{val} #{suffix}".strip
    end.join("\n")
  end
end
