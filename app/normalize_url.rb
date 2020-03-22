class NormalizeUrl
  def self.execute(url)
    new(url).execute
  end

  attr_accessor :url

  def initialize(raw_url)
    @url = raw_url
  end

  def execute
    return url if url.start_with?('http')
    sanitaize
    append_http
  end

  private

  def sanitaize
    self.url = url.gsub(/^\/+/, '') if url =~ /^\/+/
  end

  def append_http
    self.url = "http://#{self.url}"
  end
end