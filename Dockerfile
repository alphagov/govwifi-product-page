FROM ruby:3.4.1-alpine

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock .ruby-version ./

RUN apk --update add g++ musl-dev make nodejs npm

RUN bundle install

COPY . .

RUN npm install

RUN if ping -c 2 google.co.uk ; then wget https://s3.eu-west-2.amazonaws.com/govwifi-production-product-page-data/organisations.yml -O data/organisations.yml \
    && wget https://s3.eu-west-2.amazonaws.com/govwifi-production-product-page-data/domains.yml -O data/domains.yml ; fi

EXPOSE 4567
EXPOSE 35729

RUN bundle exec middleman build
