class UrlShortenerGenerator
  AVAILABLE_CHARTERS = [*'a'..'z', *'A'..'Z', *'0'..'9'].freeze
  PATTERN = 'XXXX'.freeze

  attr_reader :original_url
  attr_accessor :short_code

  def initialize(original_url)
    @original_url = original_url
    @short_code   = nil
  end

  def generate_uniq
    Models::Url.add(key: set_char, url: original_url)

    { key: short_code, url: original_url }
  end

  private

  def set_char
    loop do
      short_code = generate_short
      break if Models::Url.find(@short_code).nil?
    end
    short_code
  end

  def generate_short
    PATTERN.gsub(/X/) { AVAILABLE_CHARTERS.sample }
  end
end