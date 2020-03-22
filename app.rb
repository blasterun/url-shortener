require_relative './app/models/url.rb'
require_relative './app/lib/normalize_url.rb'
require_relative './app/lib/url_generator.rb'
require_relative './app/services/url_shortener_service.rb'
require 'sinatra/json'

class App < Sinatra::Base
  set :public_folder, File.dirname(__FILE__) + '/static'

  post '/' do
    if params[:url] && !params[:url].empty?
      url = UrlShortenerService.new(params[:url]).execute
      json url
    else
      status 400
    end
  end

  get '/' do
    erb :index
  end

  get '/:short' do
    url = Models::Url.find(params[:short])
    if url
      redirect to(url), 301
    else
      halt 404, { message: 'Not found' }.to_json
    end
  end
end
