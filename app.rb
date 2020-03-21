require_relative './app/services/url_shortener_service.rb'

class App < Sinatra::Base

  post "/" do
    # url = UrlShortenerService.new(params[:url]).shorten # return value long and short
    # render {

    # }
  end

  get "/" do
    #p 'hello'
  end

  get "/:short" do
    # url = UrlShortenerService.new(params[:url]).longer
    # if url
    #   redirect to url 301
    #
    #redirect url, 303
    # else
    #   halt 404, { message:'Not found' }.to_json
    # end
  end

end