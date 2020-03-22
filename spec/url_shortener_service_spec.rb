require File.expand_path '../test_helper.rb', __FILE__

describe UrlShortenerService do
  it "should respond with hash and correct values" do
    res = UrlShortenerService.new('example.com').execute
    assert_equal 'http://example.com', res[:url]
    assert_match /\/\w{6}/, res[:short_url]
  end

  it "after execute data can be found at Url model" do
    res = UrlShortenerService.new('http://example.com').execute
    assert_equal 'http://example.com', Models::Url.find(res[:short_url][1..-1])
  end
end
