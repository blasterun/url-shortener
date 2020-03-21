require_relative './app/models/url.rb'
require_relative './app/url_shortener_generator.rb'

class App < Sinatra::Base

  post '/' do
    url = UrlShortenerGenerator.new(params[:short]).execute
    render {

    }
  end

  get '/' do
    erb :index
  end

  get '/:short' do
    url = Models::Url.find(params[:short])
    if url
      redirect url, 303
    else
      halt 404, { message: 'Not found' }.to_json
    end
  end

end