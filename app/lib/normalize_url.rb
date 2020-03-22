class NormalizeUrl
  attr_accessor :url

  def self.normalize(url)
    new(url).normalize
  end

  def initialize(raw_url)
    @url = raw_url
  end

  def normalize
    return url if url.start_with?('http')

    sanitaize
    append_http
  end

  private

  def sanitaize
    self.url = url.gsub(%r{^\/+}, '') if url =~ %r{^\/+}
  end

  def append_http
    self.url = "http://#{url}"
  end
end
