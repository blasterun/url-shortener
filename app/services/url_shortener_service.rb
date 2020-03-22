class UrlShortenerService
  attr_accessor :original_url, :short_code
  attr_reader :storage, :generator, :url_normalizer

  def initialize(url)
    @original_url   = url
    @short_code     = nil
    @storage        = Models::Url
    @generator      = UrlGenerator
    @url_normalizer = NormalizeUrl
  end

  def execute
    normalize_url
    generate_key
    save_result
    respond
  end

  private

  def respond
    { short_url: "/#{short_code}", url: original_url }
  end

  def save_result
    storage.save(key: short_code, url: original_url)
  end

  def generate_key
    self.short_code = generator.generate
  end

  def normalize_url
    self.original_url = url_normalizer.execute(original_url)
  end
end
