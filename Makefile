build:
	bundle install --path vendor/bundle
	npm install

serve: build
	bundle exec middleman server
	open http://localhost:4567
