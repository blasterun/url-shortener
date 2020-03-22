ENV['RACK_ENV'] = 'test'
require 'sinatra'
require 'minitest/autorun'
require 'rack/test'

require File.expand_path('../app.rb', __dir__)

include Rack::Test::Methods

def app
  App
end
