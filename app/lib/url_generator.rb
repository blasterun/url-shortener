class UrlGenerator
  AVAILABLE_CHARTERS = [*'a'..'z', *'A'..'Z', *'0'..'9'].freeze
  PATTERN = 'XXXXXX'.freeze

  def self.generate
    new.generate
  end

  attr_accessor :short_url

  def initizlize
    @short_url = nil
  end

  def generate
    generate_key
    short_url
  end

  private

  def generate_key
    loop do
      self.short_url = generate_short
      break if Models::Url.find(short_url).nil?
    end
  end

  def generate_short
    PATTERN.gsub(/X/) { AVAILABLE_CHARTERS.sample }
  end
end
