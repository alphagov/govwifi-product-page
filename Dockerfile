FROM governmentpaas/cf-cli@sha256:aaa82611d82bfb6b260c6168ac6a52247219ed364a2f9fffb3c7bd64be1a2888

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
