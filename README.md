# Url Shortener Service

Run  `rackup` to start application.


You can use UI or endpoin to get short url.


## Endpoint

post `/` with required param `{ url: 'https://example.com' }`

with example response:

`{short_url: '/abc123', url: 'https://example.com' }`.


## Running with Docker

```
$ docker pull amatchyshyn/url_shortener
$ docker run --rm -p 4000:4000 --name url_shortener amatchyshyn/url_shortener

```


## Run tests and rubocop

`rake test`

`rubocop`
