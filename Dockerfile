FROM governmentpaas/cf-cli@sha256:5fc9987476f0d435faa07cd0541e9963e0cf965d56ff7c5fe2a54f85097a444c

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock .ruby-version ./

RUN apk --update add g++ musl-dev make nodejs nodejs-npm
RUN bundle install

COPY . .
RUN if ping -c 2 google.co.uk ; then wget https://s3.eu-west-2.amazonaws.com/govwifi-production-product-page-data/organisations.yml -O data/organisations.yml \
    && wget https://s3.eu-west-2.amazonaws.com/govwifi-production-product-page-data/domains.yml -O data/domains.yml ; fi

EXPOSE 4567
EXPOSE 35729

RUN npm install
RUN bundle exec middleman build
