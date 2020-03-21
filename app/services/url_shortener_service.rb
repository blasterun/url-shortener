class UrlShortenerService
  AVAILABLE_CHARTERS = [*'a'..'z', *'A'..'Z', *'0'..'9'].freeze
  PATTERN = "XXXX".freeze
  @@usrls = {}

  attr_reader :original_url
  attr_accessor :short_code

  def initialize(original_url, short_code)
    @original_url = original_url
    @short_code   = short_code
  end

  def generate_uniq
    @@usrls[set_char] = original_url
    {key: set_char, url: original_url}
  end

  def get_url
    @@usrls[short_code]
  end

  def set_char
    loop do
      @short_code = generate_short
      break if @@usrls[@short_code].nil?
    end
    @short_code
  end

  def generate_short
    PATTERN.gsub(/X/) { AVAILABLE_CHARTERS.sample }
  end
end