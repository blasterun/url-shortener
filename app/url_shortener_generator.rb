class UrlShortenerGenerator
  AVAILABLE_CHARTERS = [*'a'..'z', *'A'..'Z', *'0'..'9'].freeze
  PATTERN = 'XXXX'.freeze

  attr_reader :original_url
  attr_accessor :short_code

  def initialize(original_url)
    @original_url = normalize(original_url)
    @short_code   = nil
  end

  def execute
    generate_key
    Models::Url.add(key: short_code, url: original_url)
    { short_url: "/#{short_code}", url: original_url }
  end

  private

  def generate_key
    loop do
      self.short_code = generate_short
      break if Models::Url.find(self.short_code).nil?
    end
  end

  def generate_short
    PATTERN.gsub(/X/) { AVAILABLE_CHARTERS.sample }
  end

  def normalize(url)
    NormalizeUrl.execute(url)
  end
end
