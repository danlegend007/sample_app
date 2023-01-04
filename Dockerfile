FROM ruby:3.2.1
  RUN apt-get update \
    && apt-get install -y nodejs \
    postgresql-client \
    && apt-get -q clean \
    && rm -rf /var/lib/apt/lists

  WORKDIR /usr/src/app
  COPY Gemfile* ./
  RUN bundle install
  COPY . .

  CMD bundle exec unicorn -c ./config/unicorn.rb