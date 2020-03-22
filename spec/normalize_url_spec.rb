require File.expand_path 'test_helper.rb', __dir__

describe NormalizeUrl do
  it 'should replace single and double / with http://' do
    assert_equal 'http://example.com', NormalizeUrl.normalize('//example.com')
    assert_equal 'http://example.com', NormalizeUrl.normalize('/example.com')
  end

  it 'should add http:// before www and without www' do
    assert_equal 'http://www.example.com', NormalizeUrl.normalize('www.example.com')
    assert_equal 'http://example.com', NormalizeUrl.normalize('example.com')
  end

  it 'return valid url without change' do
    assert_equal 'https://www.example.com', NormalizeUrl.normalize('https://www.example.com')
    assert_equal 'http://www.example.com', NormalizeUrl.normalize('http://www.example.com')
  end
end
