FROM ruby:2.4.3

RUN mkdir /app
WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app

EXPOSE 4000

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "4000"]

