require File.expand_path '../test_helper.rb', __FILE__

include Rack::Test::Methods

def app
  App
end

describe 'NormalizeUrl' do
  it "should replace single and double / with http://" do
    assert_equal 'http://example.com', NormalizeUrl.execute('//example.com')
    assert_equal 'http://example.com', NormalizeUrl.execute('/example.com')
  end

  it "should add http:// before www and without www" do
    assert_equal 'http://www.example.com', NormalizeUrl.execute('www.example.com')
    assert_equal 'http://example.com', NormalizeUrl.execute('example.com')
  end

  it 'return valid url without change' do
    assert_equal 'https://www.example.com', NormalizeUrl.execute('https://www.example.com')
    assert_equal 'http://www.example.com', NormalizeUrl.execute('http://www.example.com')
  end
end
