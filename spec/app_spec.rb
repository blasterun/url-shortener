# assert_redirected_to
require File.expand_path '../test_helper.rb', __FILE__

describe App do
  it "should render main page" do
    get '/'
    assert last_response.ok?
    last_response.body.must_include 'Enter your url'
  end

  it "be able to create" do
    # get "/customers/new"
    # assert_response :success
    # post "/customers/create", :customer => @customer.attributes
    # assert_redirected_to "/customers/list"
  end

  it "be be redirected after visit short url" do
    res = UrlShortenerService.new('http://example.com').execute
    get res[:short_url]
    assert_equal(301, last_response.status)
    assert_equal(res[:url], last_response.header['Location'])
  end
end
