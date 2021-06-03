FROM ruby:3.0.1

RUN mkdir /app
WORKDIR /app

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -y
RUN apt-get install yarn -y


ADD Gemfile Gemfile.lock package.json yarn.lock ./

RUN gem install bundler
RUN bundle

COPY . .

EXPOSE 3000

ENTRYPOINT ["sh", "./config/docker/startup.sh"]
