require_relative './app/models/url.rb'
require_relative './app/url_shortener_generator.rb'
require_relative './app/normalize_url.rb'

class App < Sinatra::Base

  post '/' do
    if params[:url] && !params[:url].empty?
      url = UrlShortenerGenerator.new(params[:url]).execute
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