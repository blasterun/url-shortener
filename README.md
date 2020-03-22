# Url Shortener Service

Run  `rackup` to start application.


You can use UI or endpoin to get short url.


## Endpoint

post `/` with required param `{ url: 'https://example.com' }`

and you wull get response

`{short_url: '/abc123', url: 'https://example.com' }`.


## Runing with Docker

```
$ docker pull amatchyshyn/url_shortener
$ docker run --rm -p 4000:4000 --name url_shortener amatchyshyn/url_shortener

```


## Run test and rubocop

`rake test`

`rubocop`
