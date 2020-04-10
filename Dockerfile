FROM ruby:2.6.5

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs ntp npm

RUN mkdir /test_capistrano
WORKDIR /test_capistrano

COPY Gemfile Gemfile.lock package.json yarn.lock ./

RUN npm install -g yarn
RUN yarn install --check-files

RUN bundle install

VOLUME /user/local/bundle

ADD . /gpc-app