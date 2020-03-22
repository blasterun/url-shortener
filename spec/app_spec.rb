require File.expand_path 'test_helper.rb', __dir__

describe App do
  it 'should render main page' do
    get '/'
    assert last_response.ok?
    last_response.body.must_include 'Enter your url'
  end

  it 'be able to create' do
    response = post '/', url: 'http://example.com'
    json_response = JSON.parse(response.body)
    assert_equal 'http://example.com', json_response['url']
    assert_match(%r{\/\w{6}}, json_response['short_url'])
    assert_equal(200, last_response.status)
  end

  it 'be be redirected after visit short url' do
    res = UrlShortenerService.new('http://example.com').execute
    get res[:short_url]
    assert_equal(301, last_response.status)
    assert_equal(res[:url], last_response.header['Location'])
  end
end
