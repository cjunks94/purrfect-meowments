FROM ruby:3.0.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /app
WORKDIR /app

ADD Gemfile Gemfile.lock ./

RUN gem update --system
RUN gem install bundler
RUN bundle install --binstubs

COPY . .

EXPOSE 3000

ENTRYPOINT ["sh", "./config/docker/startup.sh"]

