FROM ruby:3.1.2
  RUN apt-get update \
    && apt-get install -yqq --no-install-recommends \
    nodejs \
    postgresql-client \
    && apt-get -q clean \
    && rm -rf /var/lib/apt/lists

  WORKDIR /usr/src/app
  COPY Gemfile* ./
  RUN bundle install
  COPY . .

  CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]