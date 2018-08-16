FROM governmentpaas/cf-cli

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock .ruby-version ./

RUN apk --update add g++ musl-dev make nodejs
RUN bundle install

COPY . .

RUN npm install --unsafe-perm
RUN bundle exec middleman build
