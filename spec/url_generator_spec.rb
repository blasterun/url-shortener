require File.expand_path '../test_helper.rb', __FILE__

describe UrlGenerator do
  it "should generate 6 random chars" do
    assert_match /\w{6}/, UrlGenerator.generate
  end

  it "should overwrite short_url variable after generate" do
    new_key = "abc123"
    Models::Url.save(key: new_key, url: "same url")
    url_generator = UrlGenerator.new
    url_generator.instance_variable_set(:@short_url, new_key)
    url_generator.generate
    assert new_key != url_generator.instance_variable_get(:@short_url)
  end
end
